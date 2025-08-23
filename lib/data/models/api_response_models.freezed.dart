// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptUploadResponse _$ReceiptUploadResponseFromJson(
    Map<String, dynamic> json) {
  return _ReceiptUploadResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptUploadResponse {
  /// The name of the store/merchant extracted from the receipt
  @JsonKey(name: 'storeName')
  String? get storeName => throw _privateConstructorUsedError;

  /// The total amount extracted from the receipt
  @JsonKey(name: 'receiptTotal')
  String? get receiptTotal => throw _privateConstructorUsedError;

  /// The date extracted from the receipt (ISO format)
  @JsonKey(name: 'receiptDate')
  String? get receiptDate => throw _privateConstructorUsedError;

  /// Currency extracted from the receipt
  @JsonKey(name: 'currency')
  String? get currency => throw _privateConstructorUsedError;

  /// Tax amount if detected
  @JsonKey(name: 'taxAmount')
  String? get taxAmount => throw _privateConstructorUsedError;

  /// Subtotal amount if detected
  @JsonKey(name: 'subtotal')
  String? get subtotal => throw _privateConstructorUsedError;

  /// Additional items found on the receipt
  @JsonKey(name: 'items')
  List<ReceiptItem>? get items => throw _privateConstructorUsedError;

  /// Confidence score of the OCR processing (0.0 to 1.0)
  @JsonKey(name: 'confidence')
  double? get confidence => throw _privateConstructorUsedError;

  /// Processing metadata
  @JsonKey(name: 'processingTime')
  int? get processingTimeMs => throw _privateConstructorUsedError;

  /// Receipt category if detected (groceries, restaurant, etc.)
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this ReceiptUploadResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptUploadResponseCopyWith<ReceiptUploadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptUploadResponseCopyWith<$Res> {
  factory $ReceiptUploadResponseCopyWith(ReceiptUploadResponse value,
          $Res Function(ReceiptUploadResponse) then) =
      _$ReceiptUploadResponseCopyWithImpl<$Res, ReceiptUploadResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'storeName') String? storeName,
      @JsonKey(name: 'receiptTotal') String? receiptTotal,
      @JsonKey(name: 'receiptDate') String? receiptDate,
      @JsonKey(name: 'currency') String? currency,
      @JsonKey(name: 'taxAmount') String? taxAmount,
      @JsonKey(name: 'subtotal') String? subtotal,
      @JsonKey(name: 'items') List<ReceiptItem>? items,
      @JsonKey(name: 'confidence') double? confidence,
      @JsonKey(name: 'processingTime') int? processingTimeMs,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class _$ReceiptUploadResponseCopyWithImpl<$Res,
        $Val extends ReceiptUploadResponse>
    implements $ReceiptUploadResponseCopyWith<$Res> {
  _$ReceiptUploadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = freezed,
    Object? receiptTotal = freezed,
    Object? receiptDate = freezed,
    Object? currency = freezed,
    Object? taxAmount = freezed,
    Object? subtotal = freezed,
    Object? items = freezed,
    Object? confidence = freezed,
    Object? processingTimeMs = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTotal: freezed == receiptTotal
          ? _value.receiptTotal
          : receiptTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptDate: freezed == receiptDate
          ? _value.receiptDate
          : receiptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      processingTimeMs: freezed == processingTimeMs
          ? _value.processingTimeMs
          : processingTimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptUploadResponseImplCopyWith<$Res>
    implements $ReceiptUploadResponseCopyWith<$Res> {
  factory _$$ReceiptUploadResponseImplCopyWith(
          _$ReceiptUploadResponseImpl value,
          $Res Function(_$ReceiptUploadResponseImpl) then) =
      __$$ReceiptUploadResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'storeName') String? storeName,
      @JsonKey(name: 'receiptTotal') String? receiptTotal,
      @JsonKey(name: 'receiptDate') String? receiptDate,
      @JsonKey(name: 'currency') String? currency,
      @JsonKey(name: 'taxAmount') String? taxAmount,
      @JsonKey(name: 'subtotal') String? subtotal,
      @JsonKey(name: 'items') List<ReceiptItem>? items,
      @JsonKey(name: 'confidence') double? confidence,
      @JsonKey(name: 'processingTime') int? processingTimeMs,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class __$$ReceiptUploadResponseImplCopyWithImpl<$Res>
    extends _$ReceiptUploadResponseCopyWithImpl<$Res,
        _$ReceiptUploadResponseImpl>
    implements _$$ReceiptUploadResponseImplCopyWith<$Res> {
  __$$ReceiptUploadResponseImplCopyWithImpl(_$ReceiptUploadResponseImpl _value,
      $Res Function(_$ReceiptUploadResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = freezed,
    Object? receiptTotal = freezed,
    Object? receiptDate = freezed,
    Object? currency = freezed,
    Object? taxAmount = freezed,
    Object? subtotal = freezed,
    Object? items = freezed,
    Object? confidence = freezed,
    Object? processingTimeMs = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ReceiptUploadResponseImpl(
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTotal: freezed == receiptTotal
          ? _value.receiptTotal
          : receiptTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptDate: freezed == receiptDate
          ? _value.receiptDate
          : receiptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>?,
      confidence: freezed == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double?,
      processingTimeMs: freezed == processingTimeMs
          ? _value.processingTimeMs
          : processingTimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptUploadResponseImpl implements _ReceiptUploadResponse {
  const _$ReceiptUploadResponseImpl(
      {@JsonKey(name: 'storeName') this.storeName,
      @JsonKey(name: 'receiptTotal') this.receiptTotal,
      @JsonKey(name: 'receiptDate') this.receiptDate,
      @JsonKey(name: 'currency') this.currency,
      @JsonKey(name: 'taxAmount') this.taxAmount,
      @JsonKey(name: 'subtotal') this.subtotal,
      @JsonKey(name: 'items') final List<ReceiptItem>? items,
      @JsonKey(name: 'confidence') this.confidence,
      @JsonKey(name: 'processingTime') this.processingTimeMs,
      @JsonKey(name: 'category') this.category})
      : _items = items;

  factory _$ReceiptUploadResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptUploadResponseImplFromJson(json);

  /// The name of the store/merchant extracted from the receipt
  @override
  @JsonKey(name: 'storeName')
  final String? storeName;

  /// The total amount extracted from the receipt
  @override
  @JsonKey(name: 'receiptTotal')
  final String? receiptTotal;

  /// The date extracted from the receipt (ISO format)
  @override
  @JsonKey(name: 'receiptDate')
  final String? receiptDate;

  /// Currency extracted from the receipt
  @override
  @JsonKey(name: 'currency')
  final String? currency;

  /// Tax amount if detected
  @override
  @JsonKey(name: 'taxAmount')
  final String? taxAmount;

  /// Subtotal amount if detected
  @override
  @JsonKey(name: 'subtotal')
  final String? subtotal;

  /// Additional items found on the receipt
  final List<ReceiptItem>? _items;

  /// Additional items found on the receipt
  @override
  @JsonKey(name: 'items')
  List<ReceiptItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Confidence score of the OCR processing (0.0 to 1.0)
  @override
  @JsonKey(name: 'confidence')
  final double? confidence;

  /// Processing metadata
  @override
  @JsonKey(name: 'processingTime')
  final int? processingTimeMs;

  /// Receipt category if detected (groceries, restaurant, etc.)
  @override
  @JsonKey(name: 'category')
  final String? category;

  @override
  String toString() {
    return 'ReceiptUploadResponse(storeName: $storeName, receiptTotal: $receiptTotal, receiptDate: $receiptDate, currency: $currency, taxAmount: $taxAmount, subtotal: $subtotal, items: $items, confidence: $confidence, processingTimeMs: $processingTimeMs, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptUploadResponseImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.receiptTotal, receiptTotal) ||
                other.receiptTotal == receiptTotal) &&
            (identical(other.receiptDate, receiptDate) ||
                other.receiptDate == receiptDate) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.processingTimeMs, processingTimeMs) ||
                other.processingTimeMs == processingTimeMs) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      storeName,
      receiptTotal,
      receiptDate,
      currency,
      taxAmount,
      subtotal,
      const DeepCollectionEquality().hash(_items),
      confidence,
      processingTimeMs,
      category);

  /// Create a copy of ReceiptUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptUploadResponseImplCopyWith<_$ReceiptUploadResponseImpl>
      get copyWith => __$$ReceiptUploadResponseImplCopyWithImpl<
          _$ReceiptUploadResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptUploadResponseImplToJson(
      this,
    );
  }
}

abstract class _ReceiptUploadResponse implements ReceiptUploadResponse {
  const factory _ReceiptUploadResponse(
          {@JsonKey(name: 'storeName') final String? storeName,
          @JsonKey(name: 'receiptTotal') final String? receiptTotal,
          @JsonKey(name: 'receiptDate') final String? receiptDate,
          @JsonKey(name: 'currency') final String? currency,
          @JsonKey(name: 'taxAmount') final String? taxAmount,
          @JsonKey(name: 'subtotal') final String? subtotal,
          @JsonKey(name: 'items') final List<ReceiptItem>? items,
          @JsonKey(name: 'confidence') final double? confidence,
          @JsonKey(name: 'processingTime') final int? processingTimeMs,
          @JsonKey(name: 'category') final String? category}) =
      _$ReceiptUploadResponseImpl;

  factory _ReceiptUploadResponse.fromJson(Map<String, dynamic> json) =
      _$ReceiptUploadResponseImpl.fromJson;

  /// The name of the store/merchant extracted from the receipt
  @override
  @JsonKey(name: 'storeName')
  String? get storeName;

  /// The total amount extracted from the receipt
  @override
  @JsonKey(name: 'receiptTotal')
  String? get receiptTotal;

  /// The date extracted from the receipt (ISO format)
  @override
  @JsonKey(name: 'receiptDate')
  String? get receiptDate;

  /// Currency extracted from the receipt
  @override
  @JsonKey(name: 'currency')
  String? get currency;

  /// Tax amount if detected
  @override
  @JsonKey(name: 'taxAmount')
  String? get taxAmount;

  /// Subtotal amount if detected
  @override
  @JsonKey(name: 'subtotal')
  String? get subtotal;

  /// Additional items found on the receipt
  @override
  @JsonKey(name: 'items')
  List<ReceiptItem>? get items;

  /// Confidence score of the OCR processing (0.0 to 1.0)
  @override
  @JsonKey(name: 'confidence')
  double? get confidence;

  /// Processing metadata
  @override
  @JsonKey(name: 'processingTime')
  int? get processingTimeMs;

  /// Receipt category if detected (groceries, restaurant, etc.)
  @override
  @JsonKey(name: 'category')
  String? get category;

  /// Create a copy of ReceiptUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptUploadResponseImplCopyWith<_$ReceiptUploadResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReceiptItem _$ReceiptItemFromJson(Map<String, dynamic> json) {
  return _ReceiptItem.fromJson(json);
}

/// @nodoc
mixin _$ReceiptItem {
  /// Item name/description
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Item price
  @JsonKey(name: 'price')
  String get price => throw _privateConstructorUsedError;

  /// Quantity if detected
  @JsonKey(name: 'quantity')
  String? get quantity => throw _privateConstructorUsedError;

  /// Item category if detected
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this ReceiptItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptItemCopyWith<ReceiptItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptItemCopyWith<$Res> {
  factory $ReceiptItemCopyWith(
          ReceiptItem value, $Res Function(ReceiptItem) then) =
      _$ReceiptItemCopyWithImpl<$Res, ReceiptItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'quantity') String? quantity,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class _$ReceiptItemCopyWithImpl<$Res, $Val extends ReceiptItem>
    implements $ReceiptItemCopyWith<$Res> {
  _$ReceiptItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptItemImplCopyWith<$Res>
    implements $ReceiptItemCopyWith<$Res> {
  factory _$$ReceiptItemImplCopyWith(
          _$ReceiptItemImpl value, $Res Function(_$ReceiptItemImpl) then) =
      __$$ReceiptItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'price') String price,
      @JsonKey(name: 'quantity') String? quantity,
      @JsonKey(name: 'category') String? category});
}

/// @nodoc
class __$$ReceiptItemImplCopyWithImpl<$Res>
    extends _$ReceiptItemCopyWithImpl<$Res, _$ReceiptItemImpl>
    implements _$$ReceiptItemImplCopyWith<$Res> {
  __$$ReceiptItemImplCopyWithImpl(
      _$ReceiptItemImpl _value, $Res Function(_$ReceiptItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ReceiptItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptItemImpl implements _ReceiptItem {
  const _$ReceiptItemImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'category') this.category});

  factory _$ReceiptItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptItemImplFromJson(json);

  /// Item name/description
  @override
  @JsonKey(name: 'name')
  final String name;

  /// Item price
  @override
  @JsonKey(name: 'price')
  final String price;

  /// Quantity if detected
  @override
  @JsonKey(name: 'quantity')
  final String? quantity;

  /// Item category if detected
  @override
  @JsonKey(name: 'category')
  final String? category;

  @override
  String toString() {
    return 'ReceiptItem(name: $name, price: $price, quantity: $quantity, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, quantity, category);

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptItemImplCopyWith<_$ReceiptItemImpl> get copyWith =>
      __$$ReceiptItemImplCopyWithImpl<_$ReceiptItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptItemImplToJson(
      this,
    );
  }
}

abstract class _ReceiptItem implements ReceiptItem {
  const factory _ReceiptItem(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'price') required final String price,
      @JsonKey(name: 'quantity') final String? quantity,
      @JsonKey(name: 'category') final String? category}) = _$ReceiptItemImpl;

  factory _ReceiptItem.fromJson(Map<String, dynamic> json) =
      _$ReceiptItemImpl.fromJson;

  /// Item name/description
  @override
  @JsonKey(name: 'name')
  String get name;

  /// Item price
  @override
  @JsonKey(name: 'price')
  String get price;

  /// Quantity if detected
  @override
  @JsonKey(name: 'quantity')
  String? get quantity;

  /// Item category if detected
  @override
  @JsonKey(name: 'category')
  String? get category;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptItemImplCopyWith<_$ReceiptItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) {
  return _ApiErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorResponse {
  /// Error code returned by the server
  @JsonKey(name: 'error_code')
  String get errorCode => throw _privateConstructorUsedError;

  /// Human-readable error message
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  /// Additional details about the error
  @JsonKey(name: 'details')
  String? get details => throw _privateConstructorUsedError;

  /// Timestamp of the error
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;

  /// Request ID for debugging
  @JsonKey(name: 'request_id')
  String? get requestId => throw _privateConstructorUsedError;

  /// Serializes this ApiErrorResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiErrorResponseCopyWith<ApiErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorResponseCopyWith<$Res> {
  factory $ApiErrorResponseCopyWith(
          ApiErrorResponse value, $Res Function(ApiErrorResponse) then) =
      _$ApiErrorResponseCopyWithImpl<$Res, ApiErrorResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'error_code') String errorCode,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'details') String? details,
      @JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'request_id') String? requestId});
}

/// @nodoc
class _$ApiErrorResponseCopyWithImpl<$Res, $Val extends ApiErrorResponse>
    implements $ApiErrorResponseCopyWith<$Res> {
  _$ApiErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
    Object? message = null,
    Object? details = freezed,
    Object? timestamp = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_value.copyWith(
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiErrorResponseImplCopyWith<$Res>
    implements $ApiErrorResponseCopyWith<$Res> {
  factory _$$ApiErrorResponseImplCopyWith(_$ApiErrorResponseImpl value,
          $Res Function(_$ApiErrorResponseImpl) then) =
      __$$ApiErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'error_code') String errorCode,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'details') String? details,
      @JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'request_id') String? requestId});
}

/// @nodoc
class __$$ApiErrorResponseImplCopyWithImpl<$Res>
    extends _$ApiErrorResponseCopyWithImpl<$Res, _$ApiErrorResponseImpl>
    implements _$$ApiErrorResponseImplCopyWith<$Res> {
  __$$ApiErrorResponseImplCopyWithImpl(_$ApiErrorResponseImpl _value,
      $Res Function(_$ApiErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorCode = null,
    Object? message = null,
    Object? details = freezed,
    Object? timestamp = freezed,
    Object? requestId = freezed,
  }) {
    return _then(_$ApiErrorResponseImpl(
      errorCode: null == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      requestId: freezed == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiErrorResponseImpl implements _ApiErrorResponse {
  const _$ApiErrorResponseImpl(
      {@JsonKey(name: 'error_code') required this.errorCode,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'details') this.details,
      @JsonKey(name: 'timestamp') this.timestamp,
      @JsonKey(name: 'request_id') this.requestId});

  factory _$ApiErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiErrorResponseImplFromJson(json);

  /// Error code returned by the server
  @override
  @JsonKey(name: 'error_code')
  final String errorCode;

  /// Human-readable error message
  @override
  @JsonKey(name: 'message')
  final String message;

  /// Additional details about the error
  @override
  @JsonKey(name: 'details')
  final String? details;

  /// Timestamp of the error
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;

  /// Request ID for debugging
  @override
  @JsonKey(name: 'request_id')
  final String? requestId;

  @override
  String toString() {
    return 'ApiErrorResponse(errorCode: $errorCode, message: $message, details: $details, timestamp: $timestamp, requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorResponseImpl &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, errorCode, message, details, timestamp, requestId);

  /// Create a copy of ApiErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorResponseImplCopyWith<_$ApiErrorResponseImpl> get copyWith =>
      __$$ApiErrorResponseImplCopyWithImpl<_$ApiErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiErrorResponse implements ApiErrorResponse {
  const factory _ApiErrorResponse(
          {@JsonKey(name: 'error_code') required final String errorCode,
          @JsonKey(name: 'message') required final String message,
          @JsonKey(name: 'details') final String? details,
          @JsonKey(name: 'timestamp') final String? timestamp,
          @JsonKey(name: 'request_id') final String? requestId}) =
      _$ApiErrorResponseImpl;

  factory _ApiErrorResponse.fromJson(Map<String, dynamic> json) =
      _$ApiErrorResponseImpl.fromJson;

  /// Error code returned by the server
  @override
  @JsonKey(name: 'error_code')
  String get errorCode;

  /// Human-readable error message
  @override
  @JsonKey(name: 'message')
  String get message;

  /// Additional details about the error
  @override
  @JsonKey(name: 'details')
  String? get details;

  /// Timestamp of the error
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp;

  /// Request ID for debugging
  @override
  @JsonKey(name: 'request_id')
  String? get requestId;

  /// Create a copy of ApiErrorResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorResponseImplCopyWith<_$ApiErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadStatusResponse _$UploadStatusResponseFromJson(Map<String, dynamic> json) {
  return _UploadStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadStatusResponse {
  /// Upload status (pending, processing, completed, failed)
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  /// Progress percentage (0-100)
  @JsonKey(name: 'progress')
  int? get progress => throw _privateConstructorUsedError;

  /// Status message
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;

  /// Upload ID for tracking
  @JsonKey(name: 'upload_id')
  String? get uploadId => throw _privateConstructorUsedError;

  /// Estimated time remaining in seconds
  @JsonKey(name: 'eta_seconds')
  int? get etaSeconds => throw _privateConstructorUsedError;

  /// Serializes this UploadStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadStatusResponseCopyWith<UploadStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStatusResponseCopyWith<$Res> {
  factory $UploadStatusResponseCopyWith(UploadStatusResponse value,
          $Res Function(UploadStatusResponse) then) =
      _$UploadStatusResponseCopyWithImpl<$Res, UploadStatusResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'progress') int? progress,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'upload_id') String? uploadId,
      @JsonKey(name: 'eta_seconds') int? etaSeconds});
}

/// @nodoc
class _$UploadStatusResponseCopyWithImpl<$Res,
        $Val extends UploadStatusResponse>
    implements $UploadStatusResponseCopyWith<$Res> {
  _$UploadStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? progress = freezed,
    Object? message = freezed,
    Object? uploadId = freezed,
    Object? etaSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadId: freezed == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String?,
      etaSeconds: freezed == etaSeconds
          ? _value.etaSeconds
          : etaSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadStatusResponseImplCopyWith<$Res>
    implements $UploadStatusResponseCopyWith<$Res> {
  factory _$$UploadStatusResponseImplCopyWith(_$UploadStatusResponseImpl value,
          $Res Function(_$UploadStatusResponseImpl) then) =
      __$$UploadStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String status,
      @JsonKey(name: 'progress') int? progress,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'upload_id') String? uploadId,
      @JsonKey(name: 'eta_seconds') int? etaSeconds});
}

/// @nodoc
class __$$UploadStatusResponseImplCopyWithImpl<$Res>
    extends _$UploadStatusResponseCopyWithImpl<$Res, _$UploadStatusResponseImpl>
    implements _$$UploadStatusResponseImplCopyWith<$Res> {
  __$$UploadStatusResponseImplCopyWithImpl(_$UploadStatusResponseImpl _value,
      $Res Function(_$UploadStatusResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? progress = freezed,
    Object? message = freezed,
    Object? uploadId = freezed,
    Object? etaSeconds = freezed,
  }) {
    return _then(_$UploadStatusResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadId: freezed == uploadId
          ? _value.uploadId
          : uploadId // ignore: cast_nullable_to_non_nullable
              as String?,
      etaSeconds: freezed == etaSeconds
          ? _value.etaSeconds
          : etaSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadStatusResponseImpl implements _UploadStatusResponse {
  const _$UploadStatusResponseImpl(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'progress') this.progress,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'upload_id') this.uploadId,
      @JsonKey(name: 'eta_seconds') this.etaSeconds});

  factory _$UploadStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadStatusResponseImplFromJson(json);

  /// Upload status (pending, processing, completed, failed)
  @override
  @JsonKey(name: 'status')
  final String status;

  /// Progress percentage (0-100)
  @override
  @JsonKey(name: 'progress')
  final int? progress;

  /// Status message
  @override
  @JsonKey(name: 'message')
  final String? message;

  /// Upload ID for tracking
  @override
  @JsonKey(name: 'upload_id')
  final String? uploadId;

  /// Estimated time remaining in seconds
  @override
  @JsonKey(name: 'eta_seconds')
  final int? etaSeconds;

  @override
  String toString() {
    return 'UploadStatusResponse(status: $status, progress: $progress, message: $message, uploadId: $uploadId, etaSeconds: $etaSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStatusResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.uploadId, uploadId) ||
                other.uploadId == uploadId) &&
            (identical(other.etaSeconds, etaSeconds) ||
                other.etaSeconds == etaSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, progress, message, uploadId, etaSeconds);

  /// Create a copy of UploadStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStatusResponseImplCopyWith<_$UploadStatusResponseImpl>
      get copyWith =>
          __$$UploadStatusResponseImplCopyWithImpl<_$UploadStatusResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadStatusResponse implements UploadStatusResponse {
  const factory _UploadStatusResponse(
          {@JsonKey(name: 'status') required final String status,
          @JsonKey(name: 'progress') final int? progress,
          @JsonKey(name: 'message') final String? message,
          @JsonKey(name: 'upload_id') final String? uploadId,
          @JsonKey(name: 'eta_seconds') final int? etaSeconds}) =
      _$UploadStatusResponseImpl;

  factory _UploadStatusResponse.fromJson(Map<String, dynamic> json) =
      _$UploadStatusResponseImpl.fromJson;

  /// Upload status (pending, processing, completed, failed)
  @override
  @JsonKey(name: 'status')
  String get status;

  /// Progress percentage (0-100)
  @override
  @JsonKey(name: 'progress')
  int? get progress;

  /// Status message
  @override
  @JsonKey(name: 'message')
  String? get message;

  /// Upload ID for tracking
  @override
  @JsonKey(name: 'upload_id')
  String? get uploadId;

  /// Estimated time remaining in seconds
  @override
  @JsonKey(name: 'eta_seconds')
  int? get etaSeconds;

  /// Create a copy of UploadStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadStatusResponseImplCopyWith<_$UploadStatusResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReceiptApiResponse _$ReceiptApiResponseFromJson(Map<String, dynamic> json) {
  return _ReceiptApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptApiResponse {
  /// Whether the request was successful
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;

  /// Receipt data from upload
  @JsonKey(name: 'data')
  ReceiptUploadResponse? get data => throw _privateConstructorUsedError;

  /// Error information if request failed
  @JsonKey(name: 'error')
  ApiErrorResponse? get error => throw _privateConstructorUsedError;

  /// Response metadata
  @JsonKey(name: 'meta')
  ResponseMetadata? get metadata => throw _privateConstructorUsedError;

  /// Serializes this ReceiptApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptApiResponseCopyWith<ReceiptApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptApiResponseCopyWith<$Res> {
  factory $ReceiptApiResponseCopyWith(
          ReceiptApiResponse value, $Res Function(ReceiptApiResponse) then) =
      _$ReceiptApiResponseCopyWithImpl<$Res, ReceiptApiResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'data') ReceiptUploadResponse? data,
      @JsonKey(name: 'error') ApiErrorResponse? error,
      @JsonKey(name: 'meta') ResponseMetadata? metadata});

  $ReceiptUploadResponseCopyWith<$Res>? get data;
  $ApiErrorResponseCopyWith<$Res>? get error;
  $ResponseMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ReceiptApiResponseCopyWithImpl<$Res, $Val extends ReceiptApiResponse>
    implements $ReceiptApiResponseCopyWith<$Res> {
  _$ReceiptApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReceiptUploadResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorResponse?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ResponseMetadata?,
    ) as $Val);
  }

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptUploadResponseCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReceiptUploadResponseCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiErrorResponseCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ApiErrorResponseCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResponseMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ResponseMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReceiptApiResponseImplCopyWith<$Res>
    implements $ReceiptApiResponseCopyWith<$Res> {
  factory _$$ReceiptApiResponseImplCopyWith(_$ReceiptApiResponseImpl value,
          $Res Function(_$ReceiptApiResponseImpl) then) =
      __$$ReceiptApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'data') ReceiptUploadResponse? data,
      @JsonKey(name: 'error') ApiErrorResponse? error,
      @JsonKey(name: 'meta') ResponseMetadata? metadata});

  @override
  $ReceiptUploadResponseCopyWith<$Res>? get data;
  @override
  $ApiErrorResponseCopyWith<$Res>? get error;
  @override
  $ResponseMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ReceiptApiResponseImplCopyWithImpl<$Res>
    extends _$ReceiptApiResponseCopyWithImpl<$Res, _$ReceiptApiResponseImpl>
    implements _$$ReceiptApiResponseImplCopyWith<$Res> {
  __$$ReceiptApiResponseImplCopyWithImpl(_$ReceiptApiResponseImpl _value,
      $Res Function(_$ReceiptApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$ReceiptApiResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReceiptUploadResponse?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiErrorResponse?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ResponseMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptApiResponseImpl implements _ReceiptApiResponse {
  const _$ReceiptApiResponseImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'error') this.error,
      @JsonKey(name: 'meta') this.metadata});

  factory _$ReceiptApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptApiResponseImplFromJson(json);

  /// Whether the request was successful
  @override
  @JsonKey(name: 'success')
  final bool success;

  /// Receipt data from upload
  @override
  @JsonKey(name: 'data')
  final ReceiptUploadResponse? data;

  /// Error information if request failed
  @override
  @JsonKey(name: 'error')
  final ApiErrorResponse? error;

  /// Response metadata
  @override
  @JsonKey(name: 'meta')
  final ResponseMetadata? metadata;

  @override
  String toString() {
    return 'ReceiptApiResponse(success: $success, data: $data, error: $error, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, error, metadata);

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptApiResponseImplCopyWith<_$ReceiptApiResponseImpl> get copyWith =>
      __$$ReceiptApiResponseImplCopyWithImpl<_$ReceiptApiResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ReceiptApiResponse implements ReceiptApiResponse {
  const factory _ReceiptApiResponse(
          {@JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'data') final ReceiptUploadResponse? data,
          @JsonKey(name: 'error') final ApiErrorResponse? error,
          @JsonKey(name: 'meta') final ResponseMetadata? metadata}) =
      _$ReceiptApiResponseImpl;

  factory _ReceiptApiResponse.fromJson(Map<String, dynamic> json) =
      _$ReceiptApiResponseImpl.fromJson;

  /// Whether the request was successful
  @override
  @JsonKey(name: 'success')
  bool get success;

  /// Receipt data from upload
  @override
  @JsonKey(name: 'data')
  ReceiptUploadResponse? get data;

  /// Error information if request failed
  @override
  @JsonKey(name: 'error')
  ApiErrorResponse? get error;

  /// Response metadata
  @override
  @JsonKey(name: 'meta')
  ResponseMetadata? get metadata;

  /// Create a copy of ReceiptApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptApiResponseImplCopyWith<_$ReceiptApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseMetadata _$ResponseMetadataFromJson(Map<String, dynamic> json) {
  return _ResponseMetadata.fromJson(json);
}

/// @nodoc
mixin _$ResponseMetadata {
  /// Server timestamp
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;

  /// API version used
  @JsonKey(name: 'api_version')
  String? get apiVersion => throw _privateConstructorUsedError;

  /// Server response time in milliseconds
  @JsonKey(name: 'response_time_ms')
  int? get responseTimeMs => throw _privateConstructorUsedError;

  /// Rate limiting information
  @JsonKey(name: 'rate_limit')
  RateLimit? get rateLimit => throw _privateConstructorUsedError;

  /// Serializes this ResponseMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseMetadataCopyWith<ResponseMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseMetadataCopyWith<$Res> {
  factory $ResponseMetadataCopyWith(
          ResponseMetadata value, $Res Function(ResponseMetadata) then) =
      _$ResponseMetadataCopyWithImpl<$Res, ResponseMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'api_version') String? apiVersion,
      @JsonKey(name: 'response_time_ms') int? responseTimeMs,
      @JsonKey(name: 'rate_limit') RateLimit? rateLimit});

  $RateLimitCopyWith<$Res>? get rateLimit;
}

/// @nodoc
class _$ResponseMetadataCopyWithImpl<$Res, $Val extends ResponseMetadata>
    implements $ResponseMetadataCopyWith<$Res> {
  _$ResponseMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? apiVersion = freezed,
    Object? responseTimeMs = freezed,
    Object? rateLimit = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTimeMs: freezed == responseTimeMs
          ? _value.responseTimeMs
          : responseTimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      rateLimit: freezed == rateLimit
          ? _value.rateLimit
          : rateLimit // ignore: cast_nullable_to_non_nullable
              as RateLimit?,
    ) as $Val);
  }

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RateLimitCopyWith<$Res>? get rateLimit {
    if (_value.rateLimit == null) {
      return null;
    }

    return $RateLimitCopyWith<$Res>(_value.rateLimit!, (value) {
      return _then(_value.copyWith(rateLimit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseMetadataImplCopyWith<$Res>
    implements $ResponseMetadataCopyWith<$Res> {
  factory _$$ResponseMetadataImplCopyWith(_$ResponseMetadataImpl value,
          $Res Function(_$ResponseMetadataImpl) then) =
      __$$ResponseMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'timestamp') String? timestamp,
      @JsonKey(name: 'api_version') String? apiVersion,
      @JsonKey(name: 'response_time_ms') int? responseTimeMs,
      @JsonKey(name: 'rate_limit') RateLimit? rateLimit});

  @override
  $RateLimitCopyWith<$Res>? get rateLimit;
}

/// @nodoc
class __$$ResponseMetadataImplCopyWithImpl<$Res>
    extends _$ResponseMetadataCopyWithImpl<$Res, _$ResponseMetadataImpl>
    implements _$$ResponseMetadataImplCopyWith<$Res> {
  __$$ResponseMetadataImplCopyWithImpl(_$ResponseMetadataImpl _value,
      $Res Function(_$ResponseMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = freezed,
    Object? apiVersion = freezed,
    Object? responseTimeMs = freezed,
    Object? rateLimit = freezed,
  }) {
    return _then(_$ResponseMetadataImpl(
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      apiVersion: freezed == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      responseTimeMs: freezed == responseTimeMs
          ? _value.responseTimeMs
          : responseTimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      rateLimit: freezed == rateLimit
          ? _value.rateLimit
          : rateLimit // ignore: cast_nullable_to_non_nullable
              as RateLimit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseMetadataImpl implements _ResponseMetadata {
  const _$ResponseMetadataImpl(
      {@JsonKey(name: 'timestamp') this.timestamp,
      @JsonKey(name: 'api_version') this.apiVersion,
      @JsonKey(name: 'response_time_ms') this.responseTimeMs,
      @JsonKey(name: 'rate_limit') this.rateLimit});

  factory _$ResponseMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseMetadataImplFromJson(json);

  /// Server timestamp
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;

  /// API version used
  @override
  @JsonKey(name: 'api_version')
  final String? apiVersion;

  /// Server response time in milliseconds
  @override
  @JsonKey(name: 'response_time_ms')
  final int? responseTimeMs;

  /// Rate limiting information
  @override
  @JsonKey(name: 'rate_limit')
  final RateLimit? rateLimit;

  @override
  String toString() {
    return 'ResponseMetadata(timestamp: $timestamp, apiVersion: $apiVersion, responseTimeMs: $responseTimeMs, rateLimit: $rateLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseMetadataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion) &&
            (identical(other.responseTimeMs, responseTimeMs) ||
                other.responseTimeMs == responseTimeMs) &&
            (identical(other.rateLimit, rateLimit) ||
                other.rateLimit == rateLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, apiVersion, responseTimeMs, rateLimit);

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseMetadataImplCopyWith<_$ResponseMetadataImpl> get copyWith =>
      __$$ResponseMetadataImplCopyWithImpl<_$ResponseMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseMetadataImplToJson(
      this,
    );
  }
}

abstract class _ResponseMetadata implements ResponseMetadata {
  const factory _ResponseMetadata(
          {@JsonKey(name: 'timestamp') final String? timestamp,
          @JsonKey(name: 'api_version') final String? apiVersion,
          @JsonKey(name: 'response_time_ms') final int? responseTimeMs,
          @JsonKey(name: 'rate_limit') final RateLimit? rateLimit}) =
      _$ResponseMetadataImpl;

  factory _ResponseMetadata.fromJson(Map<String, dynamic> json) =
      _$ResponseMetadataImpl.fromJson;

  /// Server timestamp
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp;

  /// API version used
  @override
  @JsonKey(name: 'api_version')
  String? get apiVersion;

  /// Server response time in milliseconds
  @override
  @JsonKey(name: 'response_time_ms')
  int? get responseTimeMs;

  /// Rate limiting information
  @override
  @JsonKey(name: 'rate_limit')
  RateLimit? get rateLimit;

  /// Create a copy of ResponseMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseMetadataImplCopyWith<_$ResponseMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RateLimit _$RateLimitFromJson(Map<String, dynamic> json) {
  return _RateLimit.fromJson(json);
}

/// @nodoc
mixin _$RateLimit {
  /// Maximum requests allowed per window
  @JsonKey(name: 'limit')
  int? get limit => throw _privateConstructorUsedError;

  /// Remaining requests in current window
  @JsonKey(name: 'remaining')
  int? get remaining => throw _privateConstructorUsedError;

  /// Time when the rate limit window resets (Unix timestamp)
  @JsonKey(name: 'reset')
  int? get reset => throw _privateConstructorUsedError;

  /// Serializes this RateLimit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RateLimitCopyWith<RateLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateLimitCopyWith<$Res> {
  factory $RateLimitCopyWith(RateLimit value, $Res Function(RateLimit) then) =
      _$RateLimitCopyWithImpl<$Res, RateLimit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'limit') int? limit,
      @JsonKey(name: 'remaining') int? remaining,
      @JsonKey(name: 'reset') int? reset});
}

/// @nodoc
class _$RateLimitCopyWithImpl<$Res, $Val extends RateLimit>
    implements $RateLimitCopyWith<$Res> {
  _$RateLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? remaining = freezed,
    Object? reset = freezed,
  }) {
    return _then(_value.copyWith(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      reset: freezed == reset
          ? _value.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RateLimitImplCopyWith<$Res>
    implements $RateLimitCopyWith<$Res> {
  factory _$$RateLimitImplCopyWith(
          _$RateLimitImpl value, $Res Function(_$RateLimitImpl) then) =
      __$$RateLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'limit') int? limit,
      @JsonKey(name: 'remaining') int? remaining,
      @JsonKey(name: 'reset') int? reset});
}

/// @nodoc
class __$$RateLimitImplCopyWithImpl<$Res>
    extends _$RateLimitCopyWithImpl<$Res, _$RateLimitImpl>
    implements _$$RateLimitImplCopyWith<$Res> {
  __$$RateLimitImplCopyWithImpl(
      _$RateLimitImpl _value, $Res Function(_$RateLimitImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? remaining = freezed,
    Object? reset = freezed,
  }) {
    return _then(_$RateLimitImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      reset: freezed == reset
          ? _value.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RateLimitImpl implements _RateLimit {
  const _$RateLimitImpl(
      {@JsonKey(name: 'limit') this.limit,
      @JsonKey(name: 'remaining') this.remaining,
      @JsonKey(name: 'reset') this.reset});

  factory _$RateLimitImpl.fromJson(Map<String, dynamic> json) =>
      _$$RateLimitImplFromJson(json);

  /// Maximum requests allowed per window
  @override
  @JsonKey(name: 'limit')
  final int? limit;

  /// Remaining requests in current window
  @override
  @JsonKey(name: 'remaining')
  final int? remaining;

  /// Time when the rate limit window resets (Unix timestamp)
  @override
  @JsonKey(name: 'reset')
  final int? reset;

  @override
  String toString() {
    return 'RateLimit(limit: $limit, remaining: $remaining, reset: $reset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.reset, reset) || other.reset == reset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, remaining, reset);

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitImplCopyWith<_$RateLimitImpl> get copyWith =>
      __$$RateLimitImplCopyWithImpl<_$RateLimitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RateLimitImplToJson(
      this,
    );
  }
}

abstract class _RateLimit implements RateLimit {
  const factory _RateLimit(
      {@JsonKey(name: 'limit') final int? limit,
      @JsonKey(name: 'remaining') final int? remaining,
      @JsonKey(name: 'reset') final int? reset}) = _$RateLimitImpl;

  factory _RateLimit.fromJson(Map<String, dynamic> json) =
      _$RateLimitImpl.fromJson;

  /// Maximum requests allowed per window
  @override
  @JsonKey(name: 'limit')
  int? get limit;

  /// Remaining requests in current window
  @override
  @JsonKey(name: 'remaining')
  int? get remaining;

  /// Time when the rate limit window resets (Unix timestamp)
  @override
  @JsonKey(name: 'reset')
  int? get reset;

  /// Create a copy of RateLimit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitImplCopyWith<_$RateLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
