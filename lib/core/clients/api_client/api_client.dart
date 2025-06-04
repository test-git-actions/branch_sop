import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class ApiClient {
  Future<Either<ApiFailure, T>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>)? parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
  Future<Either<ApiFailure, T>> post<T>(
    String path, {
    required Object? body,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
