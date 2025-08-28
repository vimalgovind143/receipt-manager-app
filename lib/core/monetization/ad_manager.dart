import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/core/monetization/purchase_manager.dart';

class AdManager {
  static const String _testBannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';
  
  // Production ad unit IDs (replace with your actual IDs)
  static const String _prodBannerAdUnitId = 'ca-app-pub-YOUR_ID/banner';
  static const String _prodInterstitialAdUnitId = 'ca-app-pub-YOUR_ID/interstitial';
  
  static bool get _isTestMode => true; // Set to false for production
  
  static String get bannerAdUnitId => _isTestMode ? _testBannerAdUnitId : _prodBannerAdUnitId;
  static String get interstitialAdUnitId => _isTestMode ? _testInterstitialAdUnitId : _prodInterstitialAdUnitId;

  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;
  DateTime? _lastInterstitialShown;
  
  final PurchaseManager _purchaseManager;
  
  AdManager(this._purchaseManager);

  static Future<void> initialize() async {
    try {
      await MobileAds.instance.initialize();
      appLogger.info('Google Mobile Ads initialized successfully');
    } catch (e) {
      appLogger.error('Failed to initialize Google Mobile Ads: $e');
    }
  }

  Future<void> loadBannerAd({
    required Function(BannerAd) onAdLoaded,
    required Function(BannerAd, LoadAdError) onAdFailedToLoad,
  }) async {
    // Don't load ads for premium users
    if (await _purchaseManager.isPremiumUser()) {
      appLogger.info('Premium user - skipping banner ad load');
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          appLogger.info('Banner ad loaded');
          onAdLoaded(ad as BannerAd);
        },
        onAdFailedToLoad: (ad, error) {
          appLogger.error('Banner ad failed to load: $error');
          ad.dispose();
          onAdFailedToLoad(ad as BannerAd, error);
        },
        onAdOpened: (ad) => appLogger.info('Banner ad opened'),
        onAdClosed: (ad) => appLogger.info('Banner ad closed'),
      ),
    );
    
    await _bannerAd!.load();
  }

  Future<void> loadInterstitialAd() async {
    // Don't load ads for premium users
    if (await _purchaseManager.isPremiumUser()) {
      appLogger.info('Premium user - skipping interstitial ad load');
      return;
    }

    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;
          appLogger.info('Interstitial ad loaded');
          
          _interstitialAd!.setImmersiveMode(true);
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) => appLogger.info('Interstitial ad showed'),
            onAdDismissedFullScreenContent: (ad) {
              appLogger.info('Interstitial ad dismissed');
              ad.dispose();
              _isInterstitialAdReady = false;
              // Preload next ad
              loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              appLogger.error('Interstitial ad failed to show: $error');
              ad.dispose();
              _isInterstitialAdReady = false;
            },
          );
        },
        onAdFailedToLoad: (error) {
          appLogger.error('Interstitial ad failed to load: $error');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  Future<bool> showInterstitialAd() async {
    // Don't show ads for premium users
    if (await _purchaseManager.isPremiumUser()) {
      appLogger.info('Premium user - skipping interstitial ad show');
      return false;
    }

    // Rate limiting: don't show ads more than once every 30 seconds
    if (_lastInterstitialShown != null) {
      final timeSinceLastAd = DateTime.now().difference(_lastInterstitialShown!);
      if (timeSinceLastAd.inSeconds < 30) {
        appLogger.info('Interstitial ad rate limited');
        return false;
      }
    }

    if (_isInterstitialAdReady && _interstitialAd != null) {
      await _interstitialAd!.show();
      _lastInterstitialShown = DateTime.now();
      return true;
    } else {
      appLogger.warning('Interstitial ad not ready');
      // Try to load ad for next time
      loadInterstitialAd();
      return false;
    }
  }

  BannerAd? get bannerAd => _bannerAd;
  
  bool get isInterstitialAdReady => _isInterstitialAdReady;

  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
  }
}

// Provider for AdManager
final adManagerProvider = Provider<AdManager>((ref) {
  final purchaseManager = ref.watch(purchaseManagerProvider);
  return AdManager(purchaseManager);
});
