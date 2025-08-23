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
import 'package:receipt_manager/domain/exceptions/receipt_exceptions.dart';

void main() {
  group('Receipt Exceptions', () {
    test('DatabaseException should format message correctly', () {
      const exception = DatabaseException('Database connection failed', code: 'DB001');
      
      expect(exception.message, equals('Database connection failed'));
      expect(exception.code, equals('DB001'));
      expect(exception.toString(), contains('Database connection failed'));
      expect(exception.toString(), contains('DB001'));
    });

    test('ValidationException should handle field errors', () {
      const exception = ValidationException(
        'Validation failed',
        fieldErrors: {'email': 'Invalid email format', 'password': 'Too short'},
      );
      
      expect(exception.message, equals('Validation failed'));
      expect(exception.fieldErrors, isNotNull);
      expect(exception.fieldErrors!['email'], equals('Invalid email format'));
    });

    test('NetworkException should handle network errors', () {
      const exception = NetworkException('Connection timeout', code: 'NET001');
      
      expect(exception.message, equals('Connection timeout'));
      expect(exception.code, equals('NET001'));
    });
  });
}
