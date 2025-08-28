import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:receipt_manager/app/widgets/ad_banner_widget.dart';
import 'package:receipt_manager/app/widgets/premium_status_widget.dart';
import 'package:receipt_manager/app/widgets/premium_upgrade_dialog.dart';
import 'package:receipt_manager/core/monetization/sync_manager.dart';

/// Example page showing how to integrate ads and premium features
/// into the receipt adding flow
class ReceiptAddPageExample extends ConsumerStatefulWidget {
  const ReceiptAddPageExample({super.key});

  @override
  ConsumerState<ReceiptAddPageExample> createState() => _ReceiptAddPageExampleState();
}

class _ReceiptAddPageExampleState extends ConsumerState<ReceiptAddPageExample> {
  final _formKey = GlobalKey<FormState>();
  final _storeController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _storeController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Add Receipt'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const PremiumStatusWidget(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Ad banner at the top (only shown for free users)
          const AdBannerWidget(),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormField(
                      controller: _storeController,
                      label: 'Store Name',
                      icon: Icons.store,
                    ),
                    const SizedBox(height: 16),
                    
                    _buildFormField(
                      controller: _amountController,
                      label: 'Amount',
                      icon: Icons.attach_money,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    
                    _buildFormField(
                      controller: _dateController,
                      label: 'Date',
                      icon: Icons.calendar_today,
                      readOnly: true,
                      onTap: _selectDate,
                    ),
                    const SizedBox(height: 24),
                    
                    // Image picker section
                    _buildImagePickerSection(),
                    
                    const Spacer(),
                    
                    // Save button
                    NeumorphicButton(
                      onPressed: _saveReceipt,
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                        depth: 4,
                        color: Colors.green,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Save Receipt',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return NeumorphicContainer(
      style: NeumorphicStyle(
        depth: -2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildImagePickerSection() {
    return NeumorphicContainer(
      style: NeumorphicStyle(
        depth: -2,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Icon(
            Icons.camera_alt,
            size: 48,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          const Text(
            'Add Receipt Image',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: NeumorphicButton(
                  onPressed: _takePicture,
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  ),
                  child: const Text('Camera'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeumorphicButton(
                  onPressed: _pickFromGallery,
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  ),
                  child: const Text('Gallery'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dateController.text = picked.toString().split(' ')[0];
    }
  }

  Future<void> _takePicture() async {
    // Show interstitial ad before camera (for free users)
    await InterstitialAdHelper.showAdIfNeeded(ref, 'camera_capture');
    
    // Implement camera functionality here
    _showFeatureDialog('Camera feature would open here');
  }

  Future<void> _pickFromGallery() async {
    // Show interstitial ad before gallery (for free users)
    await InterstitialAdHelper.showAdIfNeeded(ref, 'gallery_pick');
    
    // Implement gallery picker functionality here
    _showFeatureDialog('Gallery picker would open here');
  }

  Future<void> _saveReceipt() async {
    if (_formKey.currentState!.validate()) {
      // Show interstitial ad after successful save (for free users)
      await InterstitialAdHelper.showAdIfNeeded(ref, 'receipt_save');
      
      // Create receipt data
      final receiptData = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'store': _storeController.text,
        'amount': double.tryParse(_amountController.text) ?? 0.0,
        'date': _dateController.text,
        'createdAt': DateTime.now().toIso8601String(),
      };
      
      // Sync to cloud
      final syncManager = ref.read(syncManagerProvider);
      await syncManager.syncReceipt(receiptData);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Receipt saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    }
  }

  void _showFeatureDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => NeumorphicAlertDialog(
        title: const Text('Feature Demo'),
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
