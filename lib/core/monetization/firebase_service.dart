import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/firebase_options.dart';

class FirebaseService {
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get firestore => FirebaseFirestore.instance;
  static FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
  static FirebaseStorage get storage => FirebaseStorage.instance;

  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      appLogger.info('Firebase initialized successfully');
      
      // Enable offline persistence for Firestore
      await firestore.enablePersistence();
      
      // Set analytics collection enabled
      await analytics.setAnalyticsCollectionEnabled(true);
      
    } catch (e) {
      appLogger.error('Failed to initialize Firebase: $e');
      rethrow;
    }
  }

  static Future<void> signInAnonymously() async {
    try {
      if (auth.currentUser == null) {
        await auth.signInAnonymously();
        appLogger.info('User signed in anonymously');
      }
    } catch (e) {
      appLogger.error('Failed to sign in anonymously: $e');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await auth.signOut();
      appLogger.info('User signed out');
    } catch (e) {
      appLogger.error('Failed to sign out: $e');
      rethrow;
    }
  }

  static String? get currentUserId => auth.currentUser?.uid;
  
  static bool get isUserSignedIn => auth.currentUser != null;
}

// Provider for Firebase service
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

// Provider for current user
final currentUserProvider = StreamProvider<User?>((ref) {
  return FirebaseService.auth.authStateChanges();
});
