import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/core/monetization/firebase_service.dart';

class SyncManager {
  static const String receiptsCollection = 'receipts';
  static const String categoriesCollection = 'categories';
  static const String settingsCollection = 'settings';
  
  final List<StreamSubscription> _subscriptions = [];
  bool _isOnline = true;
  final List<Map<String, dynamic>> _pendingOperations = [];

  Future<void> initialize() async {
    try {
      // Ensure user is signed in
      if (!FirebaseService.isUserSignedIn) {
        await FirebaseService.signInAnonymously();
      }
      
      // Listen to connectivity changes
      _setupConnectivityListener();
      
      appLogger.info('Sync manager initialized');
    } catch (e) {
      appLogger.error('Failed to initialize sync manager: $e');
    }
  }

  void _setupConnectivityListener() {
    // Listen to Firestore connection state
    FirebaseService.firestore.enableNetwork().then((_) {
      _isOnline = true;
      _processPendingOperations();
    }).catchError((error) {
      _isOnline = false;
      appLogger.warning('Firestore offline: $error');
    });
  }

  Future<void> syncReceipt(Map<String, dynamic> receiptData) async {
    final userId = FirebaseService.currentUserId;
    if (userId == null) {
      appLogger.warning('Cannot sync receipt: user not signed in');
      return;
    }

    try {
      if (_isOnline) {
        await _syncReceiptToFirestore(userId, receiptData);
      } else {
        _queueOperation('sync_receipt', receiptData);
      }
    } catch (e) {
      appLogger.error('Failed to sync receipt: $e');
      _queueOperation('sync_receipt', receiptData);
    }
  }

  Future<void> _syncReceiptToFirestore(String userId, Map<String, dynamic> receiptData) async {
    final receiptId = receiptData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();
    
    await FirebaseService.firestore
        .collection('users')
        .doc(userId)
        .collection(receiptsCollection)
        .doc(receiptId)
        .set({
      ...receiptData,
      'lastModified': FieldValue.serverTimestamp(),
      'syncedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
    
    appLogger.info('Receipt synced to Firestore: $receiptId');
  }

  Future<void> deleteReceipt(String receiptId) async {
    final userId = FirebaseService.currentUserId;
    if (userId == null) return;

    try {
      if (_isOnline) {
        await FirebaseService.firestore
            .collection('users')
            .doc(userId)
            .collection(receiptsCollection)
            .doc(receiptId)
            .delete();
        
        appLogger.info('Receipt deleted from Firestore: $receiptId');
      } else {
        _queueOperation('delete_receipt', {'receiptId': receiptId});
      }
    } catch (e) {
      appLogger.error('Failed to delete receipt: $e');
      _queueOperation('delete_receipt', {'receiptId': receiptId});
    }
  }

  Stream<QuerySnapshot> getReceiptsStream() {
    final userId = FirebaseService.currentUserId;
    if (userId == null) {
      return const Stream.empty();
    }

    return FirebaseService.firestore
        .collection('users')
        .doc(userId)
        .collection(receiptsCollection)
        .orderBy('lastModified', descending: true)
        .snapshots();
  }

  Future<List<Map<String, dynamic>>> getAllReceipts() async {
    final userId = FirebaseService.currentUserId;
    if (userId == null) return [];

    try {
      final snapshot = await FirebaseService.firestore
          .collection('users')
          .doc(userId)
          .collection(receiptsCollection)
          .get();

      return snapshot.docs.map((doc) => {
        'id': doc.id,
        ...doc.data(),
      }).toList();
    } catch (e) {
      appLogger.error('Failed to get receipts: $e');
      return [];
    }
  }

  Future<void> syncUserSettings(Map<String, dynamic> settings) async {
    final userId = FirebaseService.currentUserId;
    if (userId == null) return;

    try {
      if (_isOnline) {
        await FirebaseService.firestore
            .collection('users')
            .doc(userId)
            .collection(settingsCollection)
            .doc('user_preferences')
            .set({
          ...settings,
          'lastModified': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        
        appLogger.info('User settings synced to Firestore');
      } else {
        _queueOperation('sync_settings', settings);
      }
    } catch (e) {
      appLogger.error('Failed to sync settings: $e');
      _queueOperation('sync_settings', settings);
    }
  }

  Future<Map<String, dynamic>?> getUserSettings() async {
    final userId = FirebaseService.currentUserId;
    if (userId == null) return null;

    try {
      final doc = await FirebaseService.firestore
          .collection('users')
          .doc(userId)
          .collection(settingsCollection)
          .doc('user_preferences')
          .get();

      if (doc.exists) {
        return doc.data();
      }
    } catch (e) {
      appLogger.error('Failed to get user settings: $e');
    }
    
    return null;
  }

  void _queueOperation(String type, Map<String, dynamic> data) {
    _pendingOperations.add({
      'type': type,
      'data': data,
      'timestamp': DateTime.now().toIso8601String(),
    });
    
    appLogger.info('Operation queued for sync: $type');
  }

  Future<void> _processPendingOperations() async {
    if (_pendingOperations.isEmpty) return;
    
    appLogger.info('Processing ${_pendingOperations.length} pending operations');
    
    final operations = List.from(_pendingOperations);
    _pendingOperations.clear();
    
    for (final operation in operations) {
      try {
        switch (operation['type']) {
          case 'sync_receipt':
            await syncReceipt(operation['data']);
            break;
          case 'delete_receipt':
            await deleteReceipt(operation['data']['receiptId']);
            break;
          case 'sync_settings':
            await syncUserSettings(operation['data']);
            break;
        }
      } catch (e) {
        appLogger.error('Failed to process pending operation: $e');
        // Re-queue failed operations
        _pendingOperations.add(operation);
      }
    }
  }

  Future<void> performFullSync() async {
    try {
      appLogger.info('Starting full sync...');
      
      // Process any pending operations first
      await _processPendingOperations();
      
      // Sync can be extended here to handle conflicts, merge data, etc.
      
      appLogger.info('Full sync completed');
    } catch (e) {
      appLogger.error('Full sync failed: $e');
    }
  }

  bool get isOnline => _isOnline;
  
  int get pendingOperationsCount => _pendingOperations.length;

  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }
}

// Provider for SyncManager
final syncManagerProvider = Provider<SyncManager>((ref) {
  return SyncManager();
});
