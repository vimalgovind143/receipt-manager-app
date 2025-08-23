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

import 'dart:convert';
import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:receipt_manager/app/helper/notfifier.dart';
import 'package:receipt_manager/app/helper/receipt_logger.dart';
import 'package:receipt_manager/app/pages/upload/file_upload_view.dart';
import 'package:receipt_manager/app/pages/upload/image_upload_view.dart';
import 'package:receipt_manager/core/providers/providers.dart';
import 'package:receipt_manager/data/storage/receipt_database.dart';
import 'package:receipt_manager/data/storage/scheme/insert_holder_table.dart';
import 'package:receipt_manager/generated/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saver_gallery/saver_gallery.dart';

part 'home_notifier.freezed.dart';
part 'home_notifier.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String storeName,
    @Default('') String receiptTotal,
    @Default('') String receiptDate,
    @Default('') String receiptTag,
    @Default('') String receiptCategory,
    DateTime? selectedDate,
    Currency? selectedCurrency,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HomeState;
}

@riverpod
class HomeNotifier extends _$HomeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  
  late final TextEditingController _storeNameController;
  late final TextEditingController _receiptDateController;
  late final TextEditingController _receiptTotalController;
  late final TextEditingController _receiptTagController;
  late final TextEditingController _receiptCategoryController;

  @override
  HomeState build() {
    _initializeControllers();
    _initializeDefaultCurrency();
    return const HomeState();
  }

  void _initializeControllers() {
    _storeNameController = TextEditingController();
    _receiptDateController = TextEditingController();
    _receiptTotalController = TextEditingController();
    _receiptTagController = TextEditingController();
    _receiptCategoryController = TextEditingController();
  }

  void _initializeDefaultCurrency() {
    // Only set default currency if none is already selected
    if (state.selectedCurrency == null) {
      final defaultCurrency = _getDefaultCurrencyFromLocale();
      if (defaultCurrency != null) {
        state = state.copyWith(selectedCurrency: defaultCurrency);
      }
    }
  }

  Currency? _getDefaultCurrencyFromLocale() {
    try {
      final locale = Platform.localeName;
      final countryCode = locale.split('_').length > 1 ? locale.split('_')[1] : null;
      
      if (countryCode != null) {
        // Map common country codes to currencies
        final currencyMap = {
          'US': 'USD',
          'GB': 'GBP', 
          'DE': 'EUR',
          'FR': 'EUR',
          'IT': 'EUR',
          'ES': 'EUR',
          'NL': 'EUR',
          'AT': 'EUR',
          'BE': 'EUR',
          'FI': 'EUR',
          'IE': 'EUR',
          'PT': 'EUR',
          'GR': 'EUR',
          'JP': 'JPY',
          'CN': 'CNY',
          'KR': 'KRW',
          'IN': 'INR',
          'CA': 'CAD',
          'AU': 'AUD',
          'CH': 'CHF',
          'SE': 'SEK',
          'NO': 'NOK',
          'DK': 'DKK',
          'PL': 'PLN',
          'CZ': 'CZK',
          'HU': 'HUF',
          'RU': 'RUB',
          'BR': 'BRL',
          'MX': 'MXN',
        };
        
        final currencyCode = currencyMap[countryCode.toUpperCase()];
        if (currencyCode != null) {
          return CurrencyService().findByCode(currencyCode);
        }
      }
    } catch (e) {
      // If there's any error getting the locale, fall back to EUR
    }
    
    // Default fallback to EUR
    return CurrencyService().findByCode('EUR');
  }

  // Getters for controllers
  TextEditingController get storeNameController => _storeNameController;
  TextEditingController get receiptDateController => _receiptDateController;
  TextEditingController get receiptTotalController => _receiptTotalController;
  TextEditingController get receiptTagController => _receiptTagController;
  TextEditingController get receiptCategoryController => _receiptCategoryController;
  GlobalKey<FormState> get formKey => _formKey;

  Future<void> getImageResult(File image, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    
    await FlutterUploader().cancelAll();
    await FlutterUploader().clearUploads();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ImageUploadPage(image)));

    bool updated = false;
    FlutterUploader().result.listen((result) {
      if (result.statusCode == 200 && result.response != null && !updated) {
        Map<String, dynamic> r = jsonDecode(result.response!);

        _storeNameController.text = r['storeName'] ?? "";
        _receiptTotalController.text = r['receiptTotal'] ?? "";
        
        state = state.copyWith(
          storeName: r['storeName'] ?? "",
          receiptTotal: r['receiptTotal'] ?? "",
          isLoading: false,
        );

        UserNotifier.msg(S.of(context).receiptIsReady,
            S.of(context).receiptSuccessfullyAnalyzed, context);
        updated = true;
      }
    }, onError: (ex, stacktrace) {
      state = state.copyWith(isLoading: false, errorMessage: ex.toString());
      UserNotifier.fail(S.of(context).failedUploadImage, context);
    });
  }

  Future<void> galleryPicker(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await getImageResult(image, context);
    }
  }

  Future<void> cameraPicker(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await SaverGallery.saveFile(
        filePath: image.path,
        fileName: 'receipt_${DateTime.now().millisecondsSinceEpoch}.jpg',
        skipIfExists: false,
      );

      await getImageResult(image, context);
    }
  }

  Future<void> filePicker(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.single;
      await getFileResult(file, context);
    }
  }

  Future<List<String>> getStoreNames(String pattern) async {
    final repository = ref.read(receiptRepositoryProvider);
    final stores = await repository.getStoreNames();
    final storeNames = <String>{};
    
    for (var store in stores) {
      if (store.storeName.isNotEmpty) {
        storeNames.add(store.storeName);
      }
    }
    
    return storeNames
        .where((element) =>
            element.toUpperCase().startsWith(pattern.toUpperCase()))
        .toList();
  }

  Future<List<String>> getTagNames(String pattern) async {
    final repository = ref.read(receiptRepositoryProvider);
    final tags = await repository.getTagNames();
    final tagNames = <String>{};
    
    for (var tag in tags) {
      if (tag.tagName.isNotEmpty) {
        tagNames.add(tag.tagName);
      }
    }
    
    return tagNames
        .where((element) =>
            element.toUpperCase().startsWith(pattern.toUpperCase()))
        .toList();
  }

  Future<List<String>> getCategoryNames(String pattern) async {
    final repository = ref.read(receiptRepositoryProvider);
    final categories = await repository.getCategoryNames();
    final categoryNames = <String>{};
    
    for (var category in categories) {
      if (category.categoryName.isNotEmpty) {
        categoryNames.add(category.categoryName);
      }
    }
    
    return categoryNames
        .where((element) =>
            element.toUpperCase().startsWith(pattern.toUpperCase()))
        .toList();
  }

  void setDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    if (picked != null) {
      _receiptDateController.text = DateFormat.yMMMd().format(picked);
      state = state.copyWith(
        selectedDate: picked,
        receiptDate: DateFormat.yMMMd().format(picked),
      );
    }
  }

  void currencyPicker(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        state = state.copyWith(selectedCurrency: currency);
      },
    );
  }

  Future<void> submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      UserNotifier.fail(S.of(context).invalidInput, context);
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final storeNameString = _storeNameController.text.trim();
      final totalString = _receiptTotalController.text.trim();
      final dateString = _receiptDateController.text.trim();
      final tagString = _receiptTagController.text.trim();
      final categoryString = _receiptCategoryController.text.trim();

      ReceiptLogger.logger(storeNameString, totalString, dateString, tagString);

      final store = StoresCompanion(storeName: Value(storeNameString));
      final tag = TagsCompanion(tagName: Value(tagString));
      final categoriesCompanion = CategoriesCompanion(categoryName: Value(categoryString));

      final receipt = ReceiptsCompanion(
        date: Value(state.selectedDate!),
        total: Value(double.parse(totalString)),
        currency: Value(state.selectedCurrency?.symbol ?? "€"),
      );

      final receiptHolder = InsertReceiptHolder(
        tag: tag,
        store: store,
        category: categoriesCompanion,
        receipt: receipt,
      );

      final repository = ref.read(receiptRepositoryProvider);
      await repository.insertReceipt(receiptHolder);

      // Clear form but preserve the selected currency
      final currentCurrency = state.selectedCurrency;
      _clearForm();
      
      state = state.copyWith(
        isLoading: false,
        storeName: '',
        receiptTotal: '',
        receiptDate: '',
        receiptTag: '',
        receiptCategory: '',
        selectedDate: null,
        selectedCurrency: currentCurrency, // Keep the selected currency
      );

      UserNotifier.success(S.of(context).addedSuccessfully, context);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      UserNotifier.fail(e.toString(), context);
    }
  }

  void _clearForm() {
    _storeNameController.clear();
    _receiptTotalController.clear();
    _receiptDateController.clear();
    _receiptTagController.clear();
    _receiptCategoryController.clear();
  }

  String? validateStoreName(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).emptyStoreName;
    }
    return null;
  }

  String? validateTotal(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).emptyTotal;
    }
    
    try {
      double.parse(value.trim());
    } catch (_) {
      return S.of(context).emptyTotal; // You might want a more specific message
    }
    return null;
  }

  String? validateDate(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty || state.selectedDate == null) {
      return S.of(context).emptyReceiptDate;
    }
    return null;
  }

  String? validateCategory(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).emptyCategory;
    }
    return null;
  }

  Future<void> getFileResult(PlatformFile file, BuildContext context) async {
    final results = await Navigator.of(context).push<Map>(
      MaterialPageRoute<Map>(
        builder: (BuildContext context) => FileUploadPage(file),
      ),
    );

    if (results != null && results.containsKey('receipt')) {
      final InsertReceiptHolder holder = results['receipt'];

      _storeNameController.text = holder.store.storeName.value;
      _receiptTotalController.text = holder.receipt.total.value.toStringAsFixed(2);
      _receiptDateController.text = DateFormat.yMMMd().format(holder.receipt.date.value);

      state = state.copyWith(
        storeName: holder.store.storeName.value,
        receiptTotal: holder.receipt.total.value.toStringAsFixed(2),
        receiptDate: DateFormat.yMMMd().format(holder.receipt.date.value),
        selectedDate: holder.receipt.date.value,
      );

      final logger = ref.read(appLoggerProvider);
      logger.info('File upload result received', results['receipt']);
    }
  }

  void disposeControllers() {
    _storeNameController.dispose();
    _receiptDateController.dispose();
    _receiptTotalController.dispose();
    _receiptTagController.dispose();
    _receiptCategoryController.dispose();
  }
}