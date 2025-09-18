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

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:receipt_manager/data/repository/data_receipts_repository.dart';
import 'package:receipt_manager/data/storage/scheme/holder_table.dart';

part 'stats_notifier.freezed.dart';
part 'stats_notifier.g.dart';

@freezed
class StatsState with _$StatsState {
  const factory StatsState({
    @Default([]) List<ReceiptHolder> receipts,
    @Default(false) bool isLoading,
  }) = _StatsState;
}

@riverpod
class StatsNotifier extends _$StatsNotifier {
  late DataReceiptRepository _repository;

  @override
  StatsState build() {
    _repository = DataReceiptRepository();
    _loadReceipts();
    return const StatsState(isLoading: true);
  }

  Future<void> _loadReceipts() async {
    try {
      final receiptsStream = _repository.getReceipts();
      await for (final receipts in receiptsStream) {
        state = state.copyWith(
          receipts: receipts,
          isLoading: false,
        );
        break; // Take the first emission for initial load
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void refreshData() {
    state = state.copyWith(isLoading: true);
    _loadReceipts();
  }
}

@riverpod
StatsNotifier statsNotifier(StatsNotifierRef ref) {
  return StatsNotifier();
}