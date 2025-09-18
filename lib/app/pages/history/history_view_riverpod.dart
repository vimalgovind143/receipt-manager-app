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

import 'dart:core';

import 'package:animated_stack/animated_stack.dart' as stacked;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/app/pages/history/history_notifier.dart';
import 'package:receipt_manager/app/widgets/icon/icon_tile.dart';
import 'package:receipt_manager/app/widgets/slideable/slidable_widget.dart';
import 'package:receipt_manager/data/storage/scheme/holder_table.dart';
import 'package:receipt_manager/generated/l10n.dart';

class HistoryPageRiverpod extends ConsumerWidget {
  const HistoryPageRiverpod({Key? key}) : super(key: key);

  Widget _receiptVisualization(BuildContext context, WidgetRef ref) {
    final historyNotifier = ref.read(historyNotifierProvider.notifier);
    
    return StreamBuilder<List<ReceiptHolder>>(
      stream: historyNotifier.getReceipts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return Column(children: [
            Center(
              child: Image.asset(
                "assets/empty.png",
                fit: BoxFit.fill,
              ),
            ),
            Center(child: Text(S.of(context).noReceiptsInserted))
          ]);
        }

        final receipts = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: receipts.length,
            itemBuilder: (_, index) {
              final receipt = receipts[index];
              return FutureBuilder<Image?>(
                future: historyNotifier.getAssetImage(
                  receipt.store.storeName,
                  receipt.category.categoryName,
                ),
                builder: (context, snap) {
                  if (snap.hasData && snap.data != null) {
                    return SlidableHistoryWidget(
                      deleteText: S.of(context).delete,
                      deleteMethod: () => historyNotifier.deleteReceipt(receipt),
                      editText: S.of(context).edit,
                      editMethod: () => historyNotifier.editReceipt(receipt, context),
                      image: snap.data!,
                      holder: receipt,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return stacked.AnimatedStack(
      preventForegroundInteractions: true,
      backgroundColor: Colors.transparent,
      fabBackgroundColor: Colors.red,
      buttonIcon: Icons.filter_list,
      fabIconColor: Colors.white,
      animateButton: true,
      foregroundWidget: Scaffold(
        backgroundColor: Colors.white,
        appBar: NeumorphicAppBar(
          title: Text(S.of(context).receiptOverview),
        ),
        body: Column(
          children: [_receiptVisualization(context, ref)],
        ),
      ),
      columnWidget: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          IconTile(
            width: 60,
            height: 60,
            iconData: Icons.category,
            fun: () {},
          ),
        ],
      ),
      bottomWidget: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEFEFF4),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        width: 260,
        height: 50,
      ),
    );
  }
}