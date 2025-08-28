# Monetization Setup Guide

## Overview
This guide provides step-by-step instructions to complete the monetization setup for your Receipt Manager app.

## Current Implementation Status ✅

### Phase 1: Firebase & Core Infrastructure (COMPLETED)
- ✅ Firebase dependencies added to pubspec.yaml
- ✅ Firebase service with authentication
- ✅ Cloud sync manager for data synchronization
- ✅ Purchase manager with in-app purchase logic
- ✅ Ad manager with Google Mobile Ads integration

### Phase 2: UI Components (COMPLETED)
- ✅ Premium upgrade dialog
- ✅ Ad banner widget with premium user detection
- ✅ Premium status widget
- ✅ Example receipt page with ad integration

### Phase 3: Platform Configuration (COMPLETED)
- ✅ Android AdMob configuration in AndroidManifest.xml
- ✅ iOS AdMob configuration in Info.plist
- ✅ Firebase configuration files

## Next Steps Required

### 1. Firebase Project Setup
You need to create a Firebase project and configure it:

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project named "Receipt Manager"
3. Enable the following services:
   - Authentication (Anonymous sign-in)
   - Cloud Firestore
   - Analytics
   - Storage

4. Download configuration files:
   - `google-services.json` for Android → place in `android/app/`
   - `GoogleService-Info.plist` for iOS → place in `ios/Runner/`

5. Update `lib/firebase_options.dart` with your actual Firebase configuration

### 2. AdMob Account Setup
1. Create a Google AdMob account
2. Create an app in AdMob console
3. Generate ad unit IDs:
   - Banner ad unit
   - Interstitial ad unit
4. Update the following files with your actual AdMob IDs:
   - `android/app/src/main/res/values/strings.xml`
   - `ios/Runner/Info.plist`
   - `lib/core/monetization/ad_manager.dart`

### 3. App Store Configuration
#### Google Play Console:
1. Create app listing
2. Configure in-app products:
   - Product ID: `remove_ads`
   - Price: $0.99
3. Upload APK for testing

#### App Store Connect:
1. Create app listing
2. Configure in-app purchases:
   - Product ID: `remove_ads`
   - Price: $0.99
3. Upload IPA for testing

### 4. Integration with Existing App
To integrate monetization into your existing app structure:

1. **Update main navigation** to include premium status:
```dart
// In your main navigator page
import 'package:receipt_manager/app/widgets/premium_status_widget.dart';

// Add to app bar
actions: [
  const PremiumStatusWidget(),
]
```

2. **Add ads to receipt operations**:
```dart
// Before adding receipt
await InterstitialAdHelper.showAdIfNeeded(ref, 'receipt_add');

// Before editing receipt  
await InterstitialAdHelper.showAdIfNeeded(ref, 'receipt_edit');

// Before image scanning
await InterstitialAdHelper.showAdIfNeeded(ref, 'image_scan');
```

3. **Add banner ads to list views**:
```dart
// In receipt list page
Column(
  children: [
    const AdBannerWidget(),
    Expanded(child: receiptListView),
  ],
)
```

### 5. Testing
1. Test with AdMob test ads
2. Test in-app purchases in sandbox mode
3. Verify Firebase sync functionality
4. Test premium upgrade flow

### 6. Production Deployment
1. Replace test AdMob IDs with production IDs
2. Set `_isTestMode = false` in `ad_manager.dart`
3. Configure release signing
4. Submit to app stores

## Revenue Optimization Tips

### Ad Placement Strategy
- **Banner ads**: Bottom of list views, settings pages
- **Interstitial ads**: After completing actions (save, edit, scan)
- **Frequency capping**: Max 1 interstitial per 30 seconds

### Conversion Optimization
- Show upgrade prompt after 3-5 ad views
- Highlight premium benefits during ad loading
- Offer upgrade during high-engagement moments

### Analytics Tracking
Monitor these key metrics:
- Ad impression rates
- Click-through rates
- Premium conversion rate
- User retention by tier

## Support & Documentation
- [Firebase Flutter Documentation](https://firebase.flutter.dev/)
- [Google Mobile Ads Flutter](https://developers.google.com/admob/flutter)
- [In-App Purchase Plugin](https://pub.dev/packages/in_app_purchase)

## Troubleshooting
Common issues and solutions:

1. **Firebase initialization fails**: Check configuration files
2. **Ads not loading**: Verify AdMob app ID and ad unit IDs
3. **Purchase validation fails**: Check store configuration
4. **Sync issues**: Verify Firestore rules and authentication

---
*Last updated: August 28, 2025*
