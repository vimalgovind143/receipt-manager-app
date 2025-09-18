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
import 'package:receipt_manager/core/logging/app_logger.dart' as logging;
import 'package:receipt_manager/core/providers/providers.dart';
import 'package:receipt_manager/data/storage/scheme/holder_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.freezed.dart';
part 'history_notifier.g.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default([]) List<ReceiptHolder> receipts,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _HistoryState;
}

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  HistoryState build() {
    // Load receipts when the notifier is created
    _loadReceipts();
    return const HistoryState(isLoading: true);
  }

  Future<void> _loadReceipts() async {
    try {
      final repository = ref.read(receiptRepositoryProvider);
      final receiptsStream = repository.getReceipts();
      
      await for (final receipts in receiptsStream) {
        state = state.copyWith(
          receipts: receipts,
          isLoading: false,
          error: '',
        );
        break; // Take only the first emission for initial load
      }
    } catch (e) {
      logging.appLogger.error('Error loading receipts: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Stream<List<ReceiptHolder>> getReceipts() {
    final repository = ref.read(receiptRepositoryProvider);
    return repository.getReceipts();
  }

  Future<void> deleteReceipt(ReceiptHolder receipt) async {
    try {
      final repository = ref.read(receiptRepositoryProvider);
      await repository.deleteReceipt(receipt);
      
      // Update local state by removing the deleted receipt
      final updatedReceipts = state.receipts.where((r) => r != receipt).toList();
      state = state.copyWith(receipts: updatedReceipts);
      
      logging.appLogger.info('Receipt deleted successfully');
    } catch (e) {
      logging.appLogger.error('Error deleting receipt: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> editReceipt(ReceiptHolder receipt, BuildContext context) async {
    // TODO: Implement edit functionality
    logging.appLogger.info('Edit receipt functionality to be implemented');
  }

  Future<Image?> getAssetImage(String storeName, String categoryName) async {
    try {
      String storeNamePath = "assets/${storeName.split(" ")[0].trim().toLowerCase()}";
      
      List<String> extensions = [".png", ".jpeg", ".jpg"];
      for (var ext in extensions) {
        final String path = storeNamePath + ext;
        final Image? image = await _imageExists(path);
        if (image != null) return image;
      }
      
      return await _imageExists("assets/fallback.png");
    } catch (e) {
      logging.appLogger.error('Error getting asset image: $e');
      return await _imageExists("assets/fallback.png");
    }
  }

  Future<Image?> _imageExists(String path) async {
    try {
      // Note: This is a simplified version. In a real app, you might want to
      // check if the asset exists before creating the Image widget
      return Image.asset(
        path,
        fit: BoxFit.fill,
      );
    } catch (e) {
      return null;
    }
  }

  void refresh() {
    state = state.copyWith(isLoading: true);
    _loadReceipts();
  }
}