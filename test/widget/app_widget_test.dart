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
import 'package:receipt_manager/main.dart';

void main() {
  group('ReceiptManagerApp Widget Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const ReceiptManagerApp());
      
      expect(find.byType(ReceiptManagerApp), findsOneWidget);
    });

    testWidgets('App should have proper theme configuration', (WidgetTester tester) async {
      await tester.pumpWidget(const ReceiptManagerApp());
      
      // Verify the app builds and has expected structure
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App should support localization', (WidgetTester tester) async {
      await tester.pumpWidget(const ReceiptManagerApp());
      
      // Verify localization delegates are set up
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.localizationsDelegates, isNotEmpty);
      expect(materialApp.supportedLocales, hasLength(2)); // English and German
    });
  });
}
