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

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receipt_manager/app/pages/home/home_notifier.dart';
import 'package:receipt_manager/app/widgets/padding/padding_widget.dart';
import 'package:receipt_manager/app/widgets/scroll/scroll_widget.dart';
import 'package:receipt_manager/app/widgets/textfield/simple_textfield.dart';
import 'package:receipt_manager/generated/l10n.dart';

class InputFormRiverpod extends ConsumerWidget {
  final HomeNotifier notifier;
  final ScrollController _scrollController = ScrollController();

  InputFormRiverpod({required this.notifier, Key? key}) : super(key: key);

  Widget storeNameTextField(BuildContext context, HomeNotifier notifier) =>
      PaddingWidget(
          widget: SimpleTextFieldWidget(
              controller: notifier.storeNameController,
              hintText: S.of(context).storeName,
              labelText: S.of(context).storeName,
              helperText: S.of(context).theReceiptStoreName,
              validator: (value) => notifier.validateStoreName(value, context),
              getSuggestionList: notifier.getStoreNames,
              readOnly: false,
              icon: const Icon(Icons.store_mall_directory_outlined)));

  Widget tagTextField(BuildContext context, HomeNotifier notifier) =>
      ScrollWidget(
          widget: PaddingWidget(
              widget: SimpleTextFieldWidget(
            controller: notifier.receiptTagController,
            hintText: S.of(context).receiptTag,
            labelText: S.of(context).receiptTag,
            helperText: S.of(context).theReceiptTag,
            validator: (value) => null,
            getSuggestionList: notifier.getTagNames,
            icon: const Icon(Icons.tag),
            readOnly: false,
          )),
          controller: _scrollController);

  Widget totalTextField(BuildContext context, HomeNotifier notifier, WidgetRef ref) =>
      PaddingWidget(
          widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ScrollWidget(
                  widget: SimpleTextFieldWidget(
                    controller: notifier.receiptTotalController,
                    hintText: S.of(context).receiptTotal,
                    labelText: S.of(context).receiptTotal,
                    helperText: S.of(context).theReceiptTotal,
                    icon: const Icon(Icons.monetization_on_outlined),
                    validator: (value) => notifier.validateTotal(value, context),
                    inputFormatters: [CurrencyInputFormatter()],
                    keyboardType: TextInputType.number,
                    readOnly: false,
                  ),
                  controller: _scrollController)),
          PaddingWidget(
            widget: Consumer(
              builder: (context, ref, child) {
                final homeState = ref.watch(homeNotifierProvider);
                return NeumorphicButton(
                  onPressed: () => notifier.currencyPicker(context),
                  style: NeumorphicStyle(
                      color: Colors.grey[200],
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.stadium(),
                      border: const NeumorphicBorder(width: 2, color: Colors.green)),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        homeState.selectedCurrency?.code ?? "EUR",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                );
              },
            ),
          )
        ],
      ));

  Widget dateTextField(BuildContext context, HomeNotifier notifier) =>
      PaddingWidget(
          widget: SimpleTextFieldWidget(
            controller: notifier.receiptDateController,
            hintText: S.of(context).receiptDate,
            labelText: S.of(context).receiptDate,
            helperText: S.of(context).theReceiptDate,
            onTap: () => notifier.setDate(context),
            icon: const Icon(Icons.date_range),
            validator: (value) => notifier.validateDate(value, context),
            readOnly: true,
          ));

  Widget submitButton(BuildContext context, HomeNotifier notifier) =>
      PaddingWidget(
          widget: Align(
        alignment: Alignment.centerLeft,
        child: NeumorphicButton(
            onPressed: () => notifier.submit(context),
            style: const NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.stadium(),
            ),
            child: Text(S.of(context).submit,
                style: const TextStyle(fontWeight: FontWeight.bold))),
      ));

  Widget categoryTextFormat(BuildContext context, HomeNotifier notifier) =>
      ScrollWidget(
          widget: PaddingWidget(
              widget: SimpleTextFieldWidget(
            controller: notifier.receiptCategoryController,
            hintText: S.of(context).receiptCategory,
            labelText: S.of(context).receiptCategory,
            helperText: S.of(context).theReceiptCategory,
            icon: const Icon(Icons.category),
            validator: (value) => notifier.validateCategory(value, context),
            getSuggestionList: notifier.getCategoryNames,
            readOnly: false,
          )),
          controller: _scrollController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          key: notifier.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              storeNameTextField(context, notifier),
              totalTextField(context, notifier, ref),
              dateTextField(context, notifier),
              tagTextField(context, notifier),
              categoryTextFormat(context, notifier),
              submitButton(context, notifier)
            ],
          ),
        ));
  }
}