/*
 * Copyright (c) 2020 - 2021 : William Todt
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:receipt_manager/app/widgets/stats/stats_card.dart';
import 'package:receipt_manager/app/widgets/textfield/simple_textfield.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('Golden Tests - UI Components', () {
    testGoldens('SimpleTextFieldWidget renders correctly', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
        ])
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Enter store name',
                  helperText: 'The name of the store',
                  labelText: 'Store Name',
                  icon: const Icon(Icons.store),
                  readOnly: false,
                  validator: (value) => value?.isEmpty == true ? 'Required' : null,
                ),
              ),
            ),
          ),
          name: 'simple_textfield_empty',
        )
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleTextFieldWidget(
                  controller: TextEditingController(text: 'Sample Store'),
                  hintText: 'Enter store name',
                  helperText: 'The name of the store',
                  labelText: 'Store Name',
                  icon: const Icon(Icons.store),
                  readOnly: false,
                  validator: (value) => value?.isEmpty == true ? 'Required' : null,
                ),
              ),
            ),
          ),
          name: 'simple_textfield_filled',
        )
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SimpleTextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Enter store name',
                  helperText: 'The name of the store',
                  labelText: 'Store Name',
                  icon: const Icon(Icons.store),
                  readOnly: true,
                  validator: (value) => value?.isEmpty == true ? 'Required' : null,
                ),
              ),
            ),
          ),
          name: 'simple_textfield_readonly',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'simple_textfield_widget');
    });

    testGoldens('StatsCard renders correctly', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
        ])
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Container(
                height: 200,
                padding: const EdgeInsets.all(16.0),
                child: StatsCard(
                  'Total Receipts',
                  '125',
                  const Icon(Icons.receipt_long, size: 48, color: Colors.blue),
                ),
              ),
            ),
          ),
          name: 'stats_card_receipts',
        )
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Container(
                height: 200,
                padding: const EdgeInsets.all(16.0),
                child: StatsCard(
                  'Total Spent',
                  '€2,456.78',
                  const Icon(Icons.euro_symbol, size: 48, color: Colors.green),
                ),
              ),
            ),
          ),
          name: 'stats_card_money',
        )
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Container(
                height: 200,
                padding: const EdgeInsets.all(16.0),
                child: StatsCard(
                  'Unique Stores',
                  '42',
                  const Icon(Icons.store, size: 48, color: Colors.orange),
                ),
              ),
            ),
          ),
          name: 'stats_card_stores',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'stats_card_widget');
    });

    testGoldens('Button widgets render correctly', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
        ])
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Submit Receipt'),
                ),
              ),
            ),
          ),
          name: 'elevated_button',
        )
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Center(
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
          name: 'floating_action_button',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'button_widgets');
    });

    testGoldens('Form validation states', (tester) async {
      final controller = TextEditingController();
      
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
        ])
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'Store Name',
                          hintText: 'Enter store name',
                          prefixIcon: Icon(Icons.store),
                          errorText: 'This field is required',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Receipt Total',
                          hintText: 'Enter amount',
                          prefixIcon: Icon(Icons.euro_symbol),
                          errorText: 'Please enter a valid amount',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          name: 'form_validation_errors',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'form_validation_states');
    });

    testGoldens('Dark theme components', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
        ])
        ..addScenario(
          widget: MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: StatsCard(
                        'Total Receipts',
                        '125',
                        const Icon(Icons.receipt_long, size: 48, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SimpleTextFieldWidget(
                      controller: TextEditingController(),
                      hintText: 'Enter store name',
                      helperText: 'The name of the store',
                      labelText: 'Store Name',
                      icon: const Icon(Icons.store),
                      readOnly: false,
                      validator: (value) => null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          name: 'dark_theme_components',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'dark_theme_widgets');
    });

    testGoldens('Responsive layout tests', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ])
        ..addScenario(
          widget: MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                            child: StatsCard(
                              'Receipts',
                              '125',
                              const Icon(Icons.receipt_long, size: 48, color: Colors.blue),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: StatsCard(
                              'Total',
                              '€2,456',
                              const Icon(Icons.euro_symbol, size: 48, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SimpleTextFieldWidget(
                      controller: TextEditingController(),
                      hintText: 'Enter store name',
                      helperText: 'The name of the store',
                      labelText: 'Store Name',
                      icon: const Icon(Icons.store),
                      readOnly: false,
                      validator: (value) => null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          name: 'responsive_layout',
        );

      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'responsive_layout_test');
    });
  });
}
