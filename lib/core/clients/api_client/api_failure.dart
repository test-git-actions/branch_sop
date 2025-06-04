import 'dart:io';

import 'package:branch_links/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
sealed class ApiFailure with _$ApiFailure {
  const ApiFailure._();

  const factory ApiFailure.connectionError({
    String? endpoint,
    int? statusCode,
    String? errorMessage,
    String? errorTitle,
    String? errorCode,
  }) = ApiFailureConnection;

  /// Error codes 500-599
  const factory ApiFailure.serverError({
    String? endpoint,
    int? statusCode,
    String? errorMessage,
    String? errorTitle,
    String? errorCode,
  }) = ApiFailureServer;

  /// Error codes 400, 402-499
  const factory ApiFailure.clientError({
    String? endpoint,
    int? statusCode,
    String? errorMessage,
    String? errorTitle,
    String? errorCode,
  }) = ApiFailureInvalidStatus;

  /// Error code 401
  const factory ApiFailure.unauthorized({
    String? endpoint,
    int? statusCode,
    String? errorMessage,
    String? errorTitle,
    String? errorCode,
  }) = ApiFailureUnauthorized;

  const factory ApiFailure.unknownError({
    String? endpoint,
    int? statusCode,
    String? errorMessage,
    String? errorTitle,
    String? errorCode,
    Object? error,
  }) = ApiFailureUnknown;

  factory ApiFailure.fromDioException(
    DioException exception, {
    required String endpoint,
  }) {
    if (exception.hasNoConnectionError) {
      return ApiFailureConnection(
        endpoint: endpoint,
      );
    } else {
      String? errorCode;
      if (exception.response != null) {
        final statusCode = exception.response?.statusCode ?? 0;

        try {
          errorCode = exception.response?.data?['errorCode'];
        } catch (_) {}

        return ApiFailure.fromStatusCode(
          statusCode,
          endpoint: endpoint,
          errorCode: errorCode,
        );
      } else {
        errorCode = switch (exception.type) {
          DioExceptionType.connectionTimeout => Constants.connectionTimeoutKey,
          DioExceptionType.receiveTimeout => Constants.receiveTimeoutKey,
          _ => Constants.unknownErrorKey,
        };
        return ApiFailureConnection(
          endpoint: endpoint,
          errorMessage: exception.message,
          errorCode: errorCode,
        );
      }
    }
  }

  @visibleForTesting
  factory ApiFailure.fromStatusCode(
    int statusCode, {
    required String endpoint,
    String? errorTitle,
    String? errorMessage,
    String? errorCode,
  }) {
    final statusRange = statusCode ~/ 100 * 100;
    if (statusCode == 401) {
      return ApiFailureUnauthorized(
        endpoint: endpoint,
        errorTitle: errorTitle,
        errorMessage: errorMessage,
        errorCode: errorCode,
        statusCode: statusCode,
      );
    } else if (statusRange == 400) {
      return ApiFailureInvalidStatus(
        endpoint: endpoint,
        errorTitle: errorTitle,
        errorMessage: errorMessage,
        errorCode: errorCode,
        statusCode: statusCode,
      );
    } else if (statusRange == 500) {
      return ApiFailureServer(
        endpoint: endpoint,
        errorTitle: errorTitle,
        errorMessage: errorMessage,
        errorCode: errorCode,
        statusCode: statusCode,
      );
    } else {
      return ApiFailureUnknown(
        endpoint: endpoint,
        errorTitle: errorTitle,
        errorMessage: errorMessage,
        errorCode: errorCode,
        statusCode: statusCode,
      );
    }
  }
}

extension DioExceptionExtension on DioException {
  bool get hasNoConnectionError {
    return type == DioExceptionType.unknown && error is SocketException;
  }
}
