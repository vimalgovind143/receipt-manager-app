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

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:receipt_manager/core/logging/app_logger.dart';
import 'package:receipt_manager/data/repository/data_receipts_repository.dart';
import 'package:receipt_manager/data/storage/receipt_database.dart';

part 'providers.g.dart';

/// Logger provider
@riverpod
AppLogger appLogger(AppLoggerRef ref) {
  return AppLogger();
}

/// Database provider
@riverpod
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

/// Receipt repository provider
@riverpod
DataReceiptRepository receiptRepository(ReceiptRepositoryRef ref) {
  return DataReceiptRepository();
}
