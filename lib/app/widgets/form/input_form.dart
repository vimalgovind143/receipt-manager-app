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
import 'package:receipt_manager/app/pages/home/home_controller.dart';
import 'package:receipt_manager/app/widgets/padding/padding_widget.dart';
import 'package:receipt_manager/app/widgets/scroll/scroll_widget.dart';
import 'package:receipt_manager/app/widgets/textfield/simple_textfield.dart';
import 'package:receipt_manager/generated/l10n.dart';

class InputForm extends StatefulWidget {
  final HomeController controller;

  InputForm({required this.controller});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final ScrollController _scrollController = ScrollController();
  late VoidCallback _controllerListener;

  @override
  void initState() {
    super.initState();
    // Create a listener that rebuilds this widget when controller changes
    _controllerListener = () {
      if (mounted) {
        setState(() {});
      }
    };
    // Note: We'll connect this listener in the controller's currencyPicker method
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget storeNameTextField(BuildContext context, HomeController controller) =>
      PaddingWidget(
          widget: SimpleTextFieldWidget(
              controller: controller.storeNameController,
              hintText: S.of(context).storeName,
              labelText: S.of(context).storeName,
              helperText: S.of(context).theReceiptStoreName,
              validator: (value) => controller.validateStoreName(value!, context),
              getSuggestionList: controller.getStoreNames,
              readOnly: false,
              icon: const Icon(Icons.store_mall_directory_outlined)));

  Widget tagTextField(BuildContext context, HomeController controller) =>
      ScrollWidget(
          widget: PaddingWidget(
              widget: SimpleTextFieldWidget(
            controller: controller.receiptTagController,
            hintText: S.of(context).receiptTag,
            labelText: S.of(context).receiptTag,
            helperText: S.of(context).theReceiptTag,
            validator: (value) => null,
            getSuggestionList: controller.getTagNames,
            icon: const Icon(Icons.tag),
            readOnly: false,
          )),
          controller: _scrollController);

  Widget totalTextField(BuildContext context, HomeController controller) =>
      PaddingWidget(
          widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ScrollWidget(
                  widget: SimpleTextFieldWidget(
                    controller: controller.receiptTotalController,
                    hintText: S.of(context).receiptTotal,
                    labelText: S.of(context).receiptTotal,
                    helperText: S.of(context).theReceiptTotal,
                    icon: const Icon(Icons.monetization_on_outlined),
                    validator: (value) => controller.validateTotal(value!, context),
                    inputFormatters: [CurrencyInputFormatter()],
                    keyboardType: TextInputType.number,
                    readOnly: false,
                  ),
                  controller: _scrollController)),
          PaddingWidget(
            widget: ValueListenableBuilder(
              valueListenable: controller.currencyNotifier,
              builder: (context, currency, child) {
                return NeumorphicButton(
                  onPressed: () => controller.currencyPicker(context),
                  style: NeumorphicStyle(
                      color: Colors.grey[200],
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.stadium(),
                      border: NeumorphicBorder(width: 2, color: Colors.green)),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        currency?.code ?? controller.currency?.code ?? "EUR",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                );
              },
            ),
          )
        ],
      ));

  Widget dateTextField(BuildContext context, HomeController controller) =>
      PaddingWidget(
          widget: SimpleTextFieldWidget(
            controller: controller.receiptDateController,
            hintText: S.of(context).receiptDate,
            labelText: S.of(context).receiptDate,
            helperText: S.of(context).theReceiptDate,
            onTap: () => controller.setDate(context),
            icon: const Icon(Icons.date_range),
            validator: (value) => controller.validateDate(value!, context),
            readOnly: true,
          ));

  Widget submitButton(BuildContext context, HomeController controller) =>
      PaddingWidget(
          widget: Align(
        alignment: Alignment.centerLeft,
        child: NeumorphicButton(
            onPressed: () => controller.submit(context),
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.stadium(),
            ),
            child: Text(S.of(context).submit,
                style: const TextStyle(fontWeight: FontWeight.bold))),
      ));

  Widget categoryTextFormat(BuildContext context, HomeController controller) =>
      ScrollWidget(
          widget: PaddingWidget(
              widget: SimpleTextFieldWidget(
            controller: controller.receiptCategoryController,
            hintText: S.of(context).receiptCategory,
            labelText: S.of(context).receiptCategory,
            helperText: S.of(context).theReceiptCategory,
            icon: const Icon(Icons.category),
            validator: (value) => controller.validateCategory(value, context),
            getSuggestionList: controller.getCategoryNames,
            readOnly: false,
          )),
          controller: _scrollController);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          key: widget.controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              storeNameTextField(context, widget.controller),
              totalTextField(context, widget.controller),
              dateTextField(context, widget.controller),
              tagTextField(context, widget.controller),
              categoryTextFormat(context, widget.controller),
              submitButton(context, widget.controller)
            ],
          ),
        ));
  }
}
