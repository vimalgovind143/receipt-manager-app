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

/// Base exception class for all receipt-related errors
abstract class ReceiptException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const ReceiptException(this.message, {this.code, this.originalError});

  @override
  String toString() => 'ReceiptException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Database-related exceptions
class DatabaseException extends ReceiptException {
  const DatabaseException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// Network/API-related exceptions
class NetworkException extends ReceiptException {
  const NetworkException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// Validation-related exceptions
class ValidationException extends ReceiptException {
  final Map<String, String>? fieldErrors;

  const ValidationException(String message, {this.fieldErrors, String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// File/Storage-related exceptions
class StorageException extends ReceiptException {
  const StorageException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// Permission-related exceptions
class PermissionException extends ReceiptException {
  const PermissionException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// Image processing exceptions
class ImageProcessingException extends ReceiptException {
  const ImageProcessingException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}

/// External API parsing exceptions
class ParsingException extends ReceiptException {
  const ParsingException(String message, {String? code, dynamic originalError})
      : super(message, code: code, originalError: originalError);
}
