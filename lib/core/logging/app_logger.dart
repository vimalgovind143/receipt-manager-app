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

import 'package:logger/logger.dart';

/// Centralized logging service with different levels
class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  late final Logger _logger;

  AppLogger._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      filter: ProductionFilter(),
    );
  }

  factory AppLogger() => _instance;

  /// Log debug messages (development only)
  void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log info messages
  void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log warning messages
  void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log error messages
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log fatal/critical errors
  void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message, error: error, stackTrace: stackTrace);
  }

  /// Log database operations
  void database(String operation, {Map<String, dynamic>? data}) {
    _logger.i('DB: $operation', error: data);
  }

  /// Log network operations
  void network(String operation, {Map<String, dynamic>? data}) {
    _logger.i('NET: $operation', error: data);
  }

  /// Log user actions
  void userAction(String action, {Map<String, dynamic>? context}) {
    _logger.i('USER: $action', error: context);
  }
}

/// Global logger instance
final appLogger = AppLogger();
