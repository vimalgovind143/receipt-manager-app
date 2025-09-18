import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:receipt_manager/app/widgets/ad_banner_widget.dart';
import 'package:receipt_manager/app/widgets/premium_status_widget.dart';
import 'package:receipt_manager/app/widgets/premium_upgrade_dialog.dart';
import 'package:receipt_manager/core/monetization/purchase_manager.dart';

/// Demo page to showcase monetization features
class MonetizationDemoPage extends ConsumerWidget {
  const MonetizationDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremiumAsync = ref.watch(isPremiumUserProvider);
    
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Monetization Demo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const PremiumStatusWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Ad banner (hidden for premium users)
          const AdBannerWidget(),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildFeatureCard(
                    'Free Tier Features',
                    [
                      '✅ Full receipt management',
                      '✅ Cloud sync',
                      '📱 Banner ads in lists',
                      '📱 Interstitial ads after actions',
                      '⏰ Ad frequency: Max 1/30 seconds',
                    ],
                    Colors.blue[50]!,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildFeatureCard(
                    'Premium Tier (\$1.00)',
                    [
                      '✨ Ad-free experience',
                      '☁️ Cloud sync (same as free)',
                      '🔒 Secure data backup',
                      '⚡ Priority support',
                      '🎯 One-time purchase',
                    ],
                    Colors.amber[50]!,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  isPremiumAsync.when(
                    data: (isPremium) => _buildActionButtons(context, isPremium),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, stack) => Text('Error: $error'),
                  ),
                  
                  const Spacer(),
                  
                  _buildImplementationStatus(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, List<String> features, Color backgroundColor) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303E57),
            ),
          ),
          const SizedBox(height: 12),
          ...features.map((feature) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              feature,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF303E57),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool isPremium) {
    return Column(
      children: [
        NeumorphicButton(
          onPressed: () => _simulateAdInteraction(context),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 4,
            color: Colors.orange,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              isPremium ? 'Add Receipt (No Ads)' : 'Add Receipt (Shows Ad)',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        if (!isPremium) ...[
          NeumorphicButton(
            onPressed: () => showPremiumUpgradeDialog(context),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              depth: 4,
              color: Colors.green,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Upgrade to Premium - \$1.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ] else ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.amber, Colors.orange],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Premium User - Ads Disabled',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildImplementationStatus() {
    return NeumorphicContainer(
      style: NeumorphicStyle(
        depth: -2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        color: Colors.green[50],
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎉 Implementation Status: 75% Complete',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '✅ Firebase integration\n'
            '✅ AdMob setup\n'
            '✅ In-app purchases\n'
            '✅ Cloud sync\n'
            '✅ Premium UI components\n'
            '⏳ Firebase project creation needed\n'
            '⏳ AdMob account setup needed',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF303E57),
            ),
          ),
        ],
      ),
    );
  }

  void _simulateAdInteraction(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => NeumorphicAlertDialog(
        title: const Text('Ad Simulation'),
        content: const Text(
          'In the real app, this would:\n\n'
          '1. Show an interstitial ad (for free users)\n'
          '2. Save the receipt to local storage\n'
          '3. Sync to Firebase cloud\n'
          '4. Update the UI\n\n'
          'Premium users skip the ad step entirely.',
        ),
        actions: [
          NeumorphicButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }
}
