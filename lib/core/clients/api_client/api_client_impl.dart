import 'package:branch_links/core/clients/api_client/api_client.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(as: ApiClient)
class ApiClientImpl implements ApiClient {
  final Dio _dio;

  ApiClientImpl(this._dio);

  @override
  Future<Either<ApiFailure, T>> get<T>(
    String path, {
    required T Function(Map<String, dynamic>)? parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final dataEither = await request(
      path,
      body: null,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
    );

    return dataEither.fold(
      (failure) => left(failure),
      (data) => parse(
        path,
        data: data,
        parser: parser,
      ),
    );
  }

  @override
  Future<Either<ApiFailure, T>> post<T>(
    String path, {
    required Object? body,
    required T Function(Map<String, dynamic>) parser,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final dataEither = await request(
      path,
      body: body,
      method: 'POST',
      queryParameters: queryParameters,
      headers: headers,
    );

    return dataEither.fold(
      (failure) => left(failure),
      (data) => parse(
        path,
        data: data,
        parser: parser,
      ),
    );
  }

  @visibleForTesting
  Future<Either<ApiFailure, dynamic>> request(
    String path, {
    required Object? body,
    required String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
  }) async {
    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        options: DioOptions(
          method: method,
          headers: headers,
          responseType: responseType,
        ),
        data: body,
      );

      return right(response.data);
    } on DioException catch (ex) {
      final failure = ApiFailure.fromDioException(
        ex,
        endpoint: path,
      );
      return left(failure);
    } catch (ex) {
      final failure = ApiFailureUnknown(
        error: ex,
        endpoint: path,
      );
      return left(failure);
    }
  }

  @visibleForTesting
  Either<ApiFailure, T> parse<T>(
    String path, {
    required dynamic data,
    required T Function(Map<String, dynamic>)? parser,
  }) {
    if (data == null) {
      final failure = ApiFailureUnknown(
        endpoint: path,
        errorTitle: 'No Data',
      );
      return left(failure);
    }

    try {
      if (parser == null) {
        return right(data as T);
      }
      return right(parser(data));
    } catch (ex) {
      final failure = ApiFailureUnknown(
        endpoint: path,
        errorTitle: 'Failed to parse the response',
      );
      return left(failure);
    }
  }
}

/// Helper class to make possible testing checking the exact parameters passed to Options
// ignore: must_be_immutable
class DioOptions extends Options with EquatableMixin {
  DioOptions({super.method, super.headers, super.responseType});

  @override
  List<Object?> get props => [method, headers, responseType];
}
