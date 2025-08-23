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

import 'package:flutter_test/flutter_test.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';

void main() {
  group('AppLogger', () {
    late AppLogger logger;

    setUp(() {
      logger = AppLogger();
    });

    test('should be singleton', () {
      final logger1 = AppLogger();
      final logger2 = AppLogger();
      
      expect(identical(logger1, logger2), isTrue);
    });

    test('should log different levels without throwing', () {
      expect(() => logger.debug('Debug message'), returnsNormally);
      expect(() => logger.info('Info message'), returnsNormally);
      expect(() => logger.warning('Warning message'), returnsNormally);
      expect(() => logger.error('Error message'), returnsNormally);
      expect(() => logger.fatal('Fatal message'), returnsNormally);
    });

    test('should log specialized operations', () {
      expect(() => logger.database('INSERT receipt', data: {'id': 1}), returnsNormally);
      expect(() => logger.network('GET /receipts', data: {'status': 200}), returnsNormally);
      expect(() => logger.userAction('Add receipt', context: {'screen': 'home'}), returnsNormally);
    });
  });
}
