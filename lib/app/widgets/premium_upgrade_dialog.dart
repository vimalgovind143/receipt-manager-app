import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:receipt_manager/core/monetization/purchase_manager.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';

class PremiumUpgradeDialog extends ConsumerStatefulWidget {
  const PremiumUpgradeDialog({super.key});

  @override
  ConsumerState<PremiumUpgradeDialog> createState() => _PremiumUpgradeDialogState();
}

class _PremiumUpgradeDialogState extends ConsumerState<PremiumUpgradeDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final purchaseManager = ref.watch(purchaseManagerProvider);
    final removeAdsProduct = purchaseManager.removeAdsProduct;

    return NeumorphicAlertDialog(
      title: const Text(
        '🚀 Upgrade to Premium',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF303E57),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Unlock the full potential of Receipt Manager!',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF303E57),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem('✨', 'Ad-free experience'),
          _buildFeatureItem('☁️', 'Cloud sync across devices'),
          _buildFeatureItem('🔒', 'Secure data backup'),
          _buildFeatureItem('⚡', 'Priority support'),
          const SizedBox(height: 20),
          if (removeAdsProduct != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'One-time purchase',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF303E57),
                    ),
                  ),
                  Text(
                    removeAdsProduct.price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'No subscriptions, no recurring fees!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
      actions: [
        NeumorphicButton(
          onPressed: () => Navigator.of(context).pop(),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            depth: 2,
          ),
          child: const Text(
            'Maybe Later',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(width: 8),
        NeumorphicButton(
          onPressed: _isLoading ? null : _handlePurchase,
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            depth: 2,
            color: Colors.green,
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Text(
                  'Upgrade Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF303E57),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handlePurchase() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final purchaseManager = ref.read(purchaseManagerProvider);
      final success = await purchaseManager.purchaseRemoveAds();
      
      if (success) {
        if (mounted) {
          Navigator.of(context).pop();
          _showSuccessDialog();
        }
      } else {
        _showErrorDialog('Purchase failed. Please try again.');
      }
    } catch (e) {
      appLogger.error('Purchase error: $e');
      _showErrorDialog('An error occurred. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => NeumorphicAlertDialog(
        title: const Text('🎉 Welcome to Premium!'),
        content: const Text(
          'Thank you for upgrading! You now have access to all premium features.',
        ),
        actions: [
          NeumorphicButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Awesome!'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => NeumorphicAlertDialog(
        title: const Text('Purchase Error'),
        content: Text(message),
        actions: [
          NeumorphicButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Helper function to show the premium upgrade dialog
void showPremiumUpgradeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const PremiumUpgradeDialog(),
  );
}
