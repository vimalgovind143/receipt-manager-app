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

import 'dart:async';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:receipt_manager/app/pages/navigator.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/generated/l10n.dart';

void main() async {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterCleanArchitecture.debugModeOn();
    Directory directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    runApp(const ProviderScope(child: ReceiptManagerApp()));
  }, (error, stack) {
    appLogger.error('Unhandled error: $error', error, stack);
  });
}

class ReceiptManagerApp extends StatelessWidget {
  const ReceiptManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('de', ''),
          Locale('en', ''),
        ],
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: const NeumorphicThemeData(
            defaultTextColor: Color(0xFF303E57),
            accentColor: Colors.red,
            baseColor: Color(0xFFF8F9FC),
            depth: 10,
            lightSource: LightSource.topRight),
        home: const NavigatorPage());
  }
}
