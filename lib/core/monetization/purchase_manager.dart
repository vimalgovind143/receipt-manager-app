import 'dart:async';
import 'dart:io';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/core/monetization/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PurchaseManager {
  static const String removeAdsProductId = 'remove_ads';
  
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  
  bool _isPremiumUser = false;
  bool _isAvailable = false;
  List<ProductDetails> _products = [];
  
  PurchaseManager() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _isAvailable = await _inAppPurchase.isAvailable();
      
      if (_isAvailable) {
        // Listen to purchase updates
        _subscription = _inAppPurchase.purchaseStream.listen(
          _handlePurchaseUpdates,
          onDone: () => _subscription.cancel(),
          onError: (error) => appLogger.error('Purchase stream error: $error'),
        );
        
        // Load products
        await _loadProducts();
        
        // Restore purchases
        await restorePurchases();
      }
      
      appLogger.info('Purchase manager initialized. Available: $_isAvailable');
    } catch (e) {
      appLogger.error('Failed to initialize purchase manager: $e');
    }
  }

  Future<void> _loadProducts() async {
    try {
      final ProductDetailsResponse response = await _inAppPurchase.queryProductDetails({removeAdsProductId});
      
      if (response.notFoundIDs.isNotEmpty) {
        appLogger.warning('Products not found: ${response.notFoundIDs}');
      }
      
      _products = response.productDetails;
      appLogger.info('Loaded ${_products.length} products');
    } catch (e) {
      appLogger.error('Failed to load products: $e');
    }
  }

  Future<void> _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        appLogger.info('Purchase pending: ${purchaseDetails.productID}');
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        appLogger.error('Purchase error: ${purchaseDetails.error}');
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
                 purchaseDetails.status == PurchaseStatus.restored) {
        
        // Verify purchase
        final bool valid = await _verifyPurchase(purchaseDetails);
        if (valid) {
          await _deliverProduct(purchaseDetails);
        } else {
          appLogger.error('Invalid purchase: ${purchaseDetails.productID}');
        }
      }
      
      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    // In production, you should verify the purchase with your server or store APIs
    // For now, we'll do basic validation
    try {
      if (purchaseDetails.verificationData.localVerificationData.isEmpty) {
        return false;
      }
      
      // Store purchase info in Firebase for cross-device sync
      if (FirebaseService.isUserSignedIn) {
        await _storePurchaseInFirebase(purchaseDetails);
      }
      
      return true;
    } catch (e) {
      appLogger.error('Purchase verification failed: $e');
      return false;
    }
  }

  Future<void> _storePurchaseInFirebase(PurchaseDetails purchaseDetails) async {
    try {
      final userId = FirebaseService.currentUserId;
      if (userId == null) return;
      
      await FirebaseService.firestore
          .collection('users')
          .doc(userId)
          .collection('purchases')
          .doc(purchaseDetails.productID)
          .set({
        'productId': purchaseDetails.productID,
        'purchaseId': purchaseDetails.purchaseID,
        'transactionDate': purchaseDetails.transactionDate,
        'status': purchaseDetails.status.toString(),
        'platform': Platform.isIOS ? 'ios' : 'android',
        'createdAt': FieldValue.serverTimestamp(),
      });
      
      // Update user's premium status
      await FirebaseService.firestore
          .collection('users')
          .doc(userId)
          .set({
        'isPremium': true,
        'premiumSince': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      
      appLogger.info('Purchase stored in Firebase');
    } catch (e) {
      appLogger.error('Failed to store purchase in Firebase: $e');
    }
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.productID == removeAdsProductId) {
      _isPremiumUser = true;
      appLogger.info('Premium status activated');
      
      // Track purchase event
      await FirebaseService.analytics.logPurchase(
        currency: 'USD',
        value: 1.0,
        parameters: {
          'item_id': removeAdsProductId,
          'item_name': 'Remove Ads',
          'item_category': 'premium',
        },
      );
    }
  }

  Future<bool> purchaseRemoveAds() async {
    if (!_isAvailable) {
      appLogger.warning('In-app purchases not available');
      return false;
    }
    
    final ProductDetails? productDetails = _products
        .where((product) => product.id == removeAdsProductId)
        .firstOrNull;
    
    if (productDetails == null) {
      appLogger.error('Remove ads product not found');
      return false;
    }
    
    try {
      final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
      final bool success = await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      
      if (success) {
        appLogger.info('Purchase initiated successfully');
      }
      
      return success;
    } catch (e) {
      appLogger.error('Purchase failed: $e');
      return false;
    }
  }

  Future<void> restorePurchases() async {
    if (!_isAvailable) return;
    
    try {
      await _inAppPurchase.restorePurchases();
      
      // Also check Firebase for purchase status if user is signed in
      if (FirebaseService.isUserSignedIn) {
        await _checkFirebasePurchaseStatus();
      }
      
      appLogger.info('Purchases restored');
    } catch (e) {
      appLogger.error('Failed to restore purchases: $e');
    }
  }

  Future<void> _checkFirebasePurchaseStatus() async {
    try {
      final userId = FirebaseService.currentUserId;
      if (userId == null) return;
      
      final userDoc = await FirebaseService.firestore
          .collection('users')
          .doc(userId)
          .get();
      
      if (userDoc.exists) {
        final data = userDoc.data();
        _isPremiumUser = data?['isPremium'] ?? false;
        appLogger.info('Premium status from Firebase: $_isPremiumUser');
      }
    } catch (e) {
      appLogger.error('Failed to check Firebase purchase status: $e');
    }
  }

  Future<bool> isPremiumUser() async {
    // Check local status first
    if (_isPremiumUser) return true;
    
    // Check Firebase if user is signed in
    if (FirebaseService.isUserSignedIn) {
      await _checkFirebasePurchaseStatus();
    }
    
    return _isPremiumUser;
  }

  ProductDetails? get removeAdsProduct => _products
      .where((product) => product.id == removeAdsProductId)
      .firstOrNull;
  
  bool get isAvailable => _isAvailable;
  
  List<ProductDetails> get products => _products;

  void dispose() {
    _subscription.cancel();
  }
}

// Provider for PurchaseManager
final purchaseManagerProvider = Provider<PurchaseManager>((ref) {
  return PurchaseManager();
});

// Provider for premium status
final isPremiumUserProvider = FutureProvider<bool>((ref) async {
  final purchaseManager = ref.watch(purchaseManagerProvider);
  return await purchaseManager.isPremiumUser();
});
