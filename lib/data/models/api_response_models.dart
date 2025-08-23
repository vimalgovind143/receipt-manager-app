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

part 'api_response_models.freezed.dart';
part 'api_response_models.g.dart';

/// Response from the receipt parser server for successful receipt processing
@freezed
class ReceiptUploadResponse with _$ReceiptUploadResponse {
  const factory ReceiptUploadResponse({
    /// The name of the store/merchant extracted from the receipt
    @JsonKey(name: 'storeName') String? storeName,
    
    /// The total amount extracted from the receipt
    @JsonKey(name: 'receiptTotal') String? receiptTotal,
    
    /// The date extracted from the receipt (ISO format)
    @JsonKey(name: 'receiptDate') String? receiptDate,
    
    /// Currency extracted from the receipt
    @JsonKey(name: 'currency') String? currency,
    
    /// Tax amount if detected
    @JsonKey(name: 'taxAmount') String? taxAmount,
    
    /// Subtotal amount if detected
    @JsonKey(name: 'subtotal') String? subtotal,
    
    /// Additional items found on the receipt
    @JsonKey(name: 'items') List<ReceiptItem>? items,
    
    /// Confidence score of the OCR processing (0.0 to 1.0)
    @JsonKey(name: 'confidence') double? confidence,
    
    /// Processing metadata
    @JsonKey(name: 'processingTime') int? processingTimeMs,
    
    /// Receipt category if detected (groceries, restaurant, etc.)
    @JsonKey(name: 'category') String? category,
  }) = _ReceiptUploadResponse;

  factory ReceiptUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptUploadResponseFromJson(json);
}

/// Individual receipt item extracted from the receipt
@freezed
class ReceiptItem with _$ReceiptItem {
  const factory ReceiptItem({
    /// Item name/description
    @JsonKey(name: 'name') required String name,
    
    /// Item price
    @JsonKey(name: 'price') required String price,
    
    /// Quantity if detected
    @JsonKey(name: 'quantity') String? quantity,
    
    /// Item category if detected
    @JsonKey(name: 'category') String? category,
  }) = _ReceiptItem;

  factory ReceiptItem.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemFromJson(json);
}

/// Error response from the receipt parser server
@freezed
class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    /// Error code returned by the server
    @JsonKey(name: 'error_code') required String errorCode,
    
    /// Human-readable error message
    @JsonKey(name: 'message') required String message,
    
    /// Additional details about the error
    @JsonKey(name: 'details') String? details,
    
    /// Timestamp of the error
    @JsonKey(name: 'timestamp') String? timestamp,
    
    /// Request ID for debugging
    @JsonKey(name: 'request_id') String? requestId,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}

/// Upload status response for tracking upload progress
@freezed
class UploadStatusResponse with _$UploadStatusResponse {
  const factory UploadStatusResponse({
    /// Upload status (pending, processing, completed, failed)
    @JsonKey(name: 'status') required String status,
    
    /// Progress percentage (0-100)
    @JsonKey(name: 'progress') int? progress,
    
    /// Status message
    @JsonKey(name: 'message') String? message,
    
    /// Upload ID for tracking
    @JsonKey(name: 'upload_id') String? uploadId,
    
    /// Estimated time remaining in seconds
    @JsonKey(name: 'eta_seconds') int? etaSeconds,
  }) = _UploadStatusResponse;

  factory UploadStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadStatusResponseFromJson(json);
}

/// Wrapper for receipt upload responses with metadata
@freezed
class ReceiptApiResponse with _$ReceiptApiResponse {
  const factory ReceiptApiResponse({
    /// Whether the request was successful
    @JsonKey(name: 'success') @Default(false) bool success,
    
    /// Receipt data from upload
    @JsonKey(name: 'data') ReceiptUploadResponse? data,
    
    /// Error information if request failed
    @JsonKey(name: 'error') ApiErrorResponse? error,
    
    /// Response metadata
    @JsonKey(name: 'meta') ResponseMetadata? metadata,
  }) = _ReceiptApiResponse;

  factory ReceiptApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptApiResponseFromJson(json);
      
  /// Factory for successful responses
  factory ReceiptApiResponse.success(ReceiptUploadResponse data, {ResponseMetadata? metadata}) =>
      ReceiptApiResponse(
        success: true,
        data: data,
        metadata: metadata,
      );
      
  /// Factory for error responses
  factory ReceiptApiResponse.error(ApiErrorResponse error, {ResponseMetadata? metadata}) =>
      ReceiptApiResponse(
        success: false,
        error: error,
        metadata: metadata,
      );
}

/// Response metadata
@freezed
class ResponseMetadata with _$ResponseMetadata {
  const factory ResponseMetadata({
    /// Server timestamp
    @JsonKey(name: 'timestamp') String? timestamp,
    
    /// API version used
    @JsonKey(name: 'api_version') String? apiVersion,
    
    /// Server response time in milliseconds
    @JsonKey(name: 'response_time_ms') int? responseTimeMs,
    
    /// Rate limiting information
    @JsonKey(name: 'rate_limit') RateLimit? rateLimit,
  }) = _ResponseMetadata;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetadataFromJson(json);
}

/// Rate limiting information
@freezed
class RateLimit with _$RateLimit {
  const factory RateLimit({
    /// Maximum requests allowed per window
    @JsonKey(name: 'limit') int? limit,
    
    /// Remaining requests in current window
    @JsonKey(name: 'remaining') int? remaining,
    
    /// Time when the rate limit window resets (Unix timestamp)
    @JsonKey(name: 'reset') int? reset,
  }) = _RateLimit;

  factory RateLimit.fromJson(Map<String, dynamic> json) =>
      _$RateLimitFromJson(json);
}
