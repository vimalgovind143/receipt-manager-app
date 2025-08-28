import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:receipt_manager/core/monetization/ad_manager.dart';
import 'package:receipt_manager/core/monetization/purchase_manager.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';

class AdBannerWidget extends ConsumerStatefulWidget {
  const AdBannerWidget({super.key});

  @override
  ConsumerState<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends ConsumerState<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() async {
    // Check if user is premium first
    final isPremium = await ref.read(isPremiumUserProvider.future);
    if (isPremium) {
      appLogger.info('Premium user - not loading banner ad');
      return;
    }

    final adManager = ref.read(adManagerProvider);
    await adManager.loadBannerAd(
      onAdLoaded: (ad) {
        setState(() {
          _bannerAd = ad;
          _isAdLoaded = true;
        });
      },
      onAdFailedToLoad: (ad, error) {
        setState(() {
          _isAdLoaded = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPremiumAsync = ref.watch(isPremiumUserProvider);
    
    return isPremiumAsync.when(
      data: (isPremium) {
        if (isPremium) {
          return const SizedBox.shrink(); // Don't show ads for premium users
        }
        
        if (_isAdLoaded && _bannerAd != null) {
          return Container(
            alignment: Alignment.center,
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          );
        } else {
          // Show placeholder while ad loads
          return Container(
            width: 320,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                'Advertisement',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          );
        }
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stack) {
        appLogger.error('Error checking premium status: $error');
        return const SizedBox.shrink();
      },
    );
  }
}

class InterstitialAdHelper {
  static Future<void> showAdIfNeeded(WidgetRef ref, String context) async {
    try {
      // Check if user is premium
      final isPremium = await ref.read(isPremiumUserProvider.future);
      if (isPremium) {
        appLogger.info('Premium user - skipping interstitial ad for $context');
        return;
      }

      final adManager = ref.read(adManagerProvider);
      final shown = await adManager.showInterstitialAd();
      
      if (shown) {
        appLogger.info('Interstitial ad shown for $context');
      } else {
        appLogger.info('Interstitial ad not ready for $context');
      }
    } catch (e) {
      appLogger.error('Error showing interstitial ad: $e');
    }
  }
}
