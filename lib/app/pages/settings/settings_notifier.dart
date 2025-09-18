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
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:receipt_manager/app/constants.dart';
import 'package:receipt_manager/app/pages/settings/api_token/api_token_view.dart';
import 'package:receipt_manager/app/pages/settings/server/server_view.dart';
import 'package:receipt_manager/core/logging/app_logger.dart' as logging;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.freezed.dart';
part 'settings_notifier.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool rotateImage,
    @Default(false) bool gaussianBlur,
    @Default(true) bool grayscaleImage,
    @Default(true) bool neuronalNetworkParser,
    @Default(true) bool https,
    @Default(true) bool legacyParser,
    @Default(false) bool trainingData,
    @Default(false) bool debugOutput,
    @Default(true) bool showArticles,
    @Default(true) bool lightTheme,
    @Default(false) bool isLoading,
    String? error,
  }) = _SettingsState;
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  late Box settingsBox;

  @override
  SettingsState build() {
    _initializeSettings();
    return const SettingsState();
  }

  Future<void> _initializeSettings() async {
    try {
      settingsBox = Hive.box('settings');
      await _readValues();
    } catch (e) {
      logging.appLogger.error('Error initializing settings: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> _readValues() async {
    try {
      state = state.copyWith(
        rotateImage: settingsBox.get(verticalImage, defaultValue: false),
        debugOutput: settingsBox.get(enableDebugOutput, defaultValue: false),
        https: settingsBox.get(enableHttps, defaultValue: true),
        gaussianBlur: settingsBox.get(enableGaussianBlur, defaultValue: false),
        grayscaleImage: settingsBox.get(enableGrayscale, defaultValue: true),
        legacyParser: settingsBox.get(useLegacyParser, defaultValue: true),
        neuronalNetworkParser: settingsBox.get(useNeuronalNetworkParser, defaultValue: true),
        showArticles: settingsBox.get(enableShowArticles, defaultValue: true),
        lightTheme: settingsBox.get(enableLightTheme, defaultValue: true),
        trainingData: settingsBox.get(enableTrainingData, defaultValue: false),
      );
    } catch (e) {
      logging.appLogger.error('Error reading settings values: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void apiTokenButtonPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => ApiTokenPage()),
    );
  }

  void serverButtonPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => ServerSettingsPage()),
    );
  }

  void toggleRotateImage(bool value) {
    try {
      settingsBox.put(verticalImage, value);
      state = state.copyWith(rotateImage: value);
      logging.appLogger.debug('Rotate image setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling rotate image: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleGrayscaleImage(bool value) {
    try {
      if (state.gaussianBlur && value == false) {
        settingsBox.put(enableGaussianBlur, false);
        state = state.copyWith(gaussianBlur: false);
      }
      
      settingsBox.put(enableGrayscale, value);
      state = state.copyWith(grayscaleImage: value);
      logging.appLogger.debug('Grayscale image setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling grayscale image: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleGaussianBlur(bool value) {
    try {
      if (!state.grayscaleImage) {
        settingsBox.put(enableGrayscale, true);
        state = state.copyWith(grayscaleImage: true);
      }
      
      settingsBox.put(enableGaussianBlur, value);
      state = state.copyWith(gaussianBlur: value);
      logging.appLogger.debug('Gaussian blur setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling gaussian blur: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleNeuronalNetworkParser(bool value) {
    try {
      settingsBox.put(useNeuronalNetworkParser, value);
      state = state.copyWith(neuronalNetworkParser: value);
      logging.appLogger.debug('Neuronal network parser setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling neuronal network parser: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleLegacyParser(bool value) {
    try {
      settingsBox.put(useLegacyParser, value);
      state = state.copyWith(legacyParser: value);
      logging.appLogger.debug('Legacy parser setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling legacy parser: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleTrainingData(bool value) {
    try {
      settingsBox.put(enableTrainingData, value);
      state = state.copyWith(trainingData: value);
      logging.appLogger.debug('Training data setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling training data: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleDebugOutput(bool value) {
    try {
      settingsBox.put(enableDebugOutput, value);
      state = state.copyWith(debugOutput: value);
      logging.appLogger.debug('Debug output setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling debug output: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleHttps(bool value) {
    try {
      settingsBox.put(enableHttps, value);
      state = state.copyWith(https: value);
      logging.appLogger.debug('HTTPS setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling HTTPS: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleShowArticles(bool value) {
    try {
      settingsBox.put(enableShowArticles, value);
      state = state.copyWith(showArticles: value);
      logging.appLogger.debug('Show articles setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling show articles: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  void toggleLightTheme(bool value) {
    try {
      settingsBox.put(enableLightTheme, value);
      state = state.copyWith(lightTheme: value);
      logging.appLogger.debug('Light theme setting changed to: $value');
    } catch (e) {
      logging.appLogger.error('Error toggling light theme: $e');
      state = state.copyWith(error: e.toString());
    }
  }
}