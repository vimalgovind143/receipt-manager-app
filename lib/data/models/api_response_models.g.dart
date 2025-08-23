// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptUploadResponseImpl _$$ReceiptUploadResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptUploadResponseImpl(
      storeName: json['storeName'] as String?,
      receiptTotal: json['receiptTotal'] as String?,
      receiptDate: json['receiptDate'] as String?,
      currency: json['currency'] as String?,
      taxAmount: json['taxAmount'] as String?,
      subtotal: json['subtotal'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ReceiptItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      confidence: (json['confidence'] as num?)?.toDouble(),
      processingTimeMs: (json['processingTime'] as num?)?.toInt(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ReceiptUploadResponseImplToJson(
        _$ReceiptUploadResponseImpl instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'receiptTotal': instance.receiptTotal,
      'receiptDate': instance.receiptDate,
      'currency': instance.currency,
      'taxAmount': instance.taxAmount,
      'subtotal': instance.subtotal,
      'items': instance.items,
      'confidence': instance.confidence,
      'processingTime': instance.processingTimeMs,
      'category': instance.category,
    };

_$ReceiptItemImpl _$$ReceiptItemImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptItemImpl(
      name: json['name'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ReceiptItemImplToJson(_$ReceiptItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
    };

_$ApiErrorResponseImpl _$$ApiErrorResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiErrorResponseImpl(
      errorCode: json['error_code'] as String,
      message: json['message'] as String,
      details: json['details'] as String?,
      timestamp: json['timestamp'] as String?,
      requestId: json['request_id'] as String?,
    );

Map<String, dynamic> _$$ApiErrorResponseImplToJson(
        _$ApiErrorResponseImpl instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'details': instance.details,
      'timestamp': instance.timestamp,
      'request_id': instance.requestId,
    };

_$UploadStatusResponseImpl _$$UploadStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadStatusResponseImpl(
      status: json['status'] as String,
      progress: (json['progress'] as num?)?.toInt(),
      message: json['message'] as String?,
      uploadId: json['upload_id'] as String?,
      etaSeconds: (json['eta_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UploadStatusResponseImplToJson(
        _$UploadStatusResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'progress': instance.progress,
      'message': instance.message,
      'upload_id': instance.uploadId,
      'eta_seconds': instance.etaSeconds,
    };

_$ReceiptApiResponseImpl _$$ReceiptApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptApiResponseImpl(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : ReceiptUploadResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ApiErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
      metadata: json['meta'] == null
          ? null
          : ResponseMetadata.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReceiptApiResponseImplToJson(
        _$ReceiptApiResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
      'meta': instance.metadata,
    };

_$ResponseMetadataImpl _$$ResponseMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseMetadataImpl(
      timestamp: json['timestamp'] as String?,
      apiVersion: json['api_version'] as String?,
      responseTimeMs: (json['response_time_ms'] as num?)?.toInt(),
      rateLimit: json['rate_limit'] == null
          ? null
          : RateLimit.fromJson(json['rate_limit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseMetadataImplToJson(
        _$ResponseMetadataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'api_version': instance.apiVersion,
      'response_time_ms': instance.responseTimeMs,
      'rate_limit': instance.rateLimit,
    };

_$RateLimitImpl _$$RateLimitImplFromJson(Map<String, dynamic> json) =>
    _$RateLimitImpl(
      limit: (json['limit'] as num?)?.toInt(),
      remaining: (json['remaining'] as num?)?.toInt(),
      reset: (json['reset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RateLimitImplToJson(_$RateLimitImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'remaining': instance.remaining,
      'reset': instance.reset,
    };
