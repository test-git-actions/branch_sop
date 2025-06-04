import 'dart:io';

import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DioExceptionExtension', () {
    group('hasNoConnectionError', () {
      test(
        'should return false if type is different than DioExceptionType.unknown',
        () {
          // arrange
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionError,
          );

          // assert
          expect(dioException.hasNoConnectionError, false);
        },
      );

      test(
        'should return false if type is DioExceptionType.unknown and error is not SocketException',
        () {
          // arrange
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.unknown,
            error: const HttpException('message'),
          );

          // assert
          expect(dioException.hasNoConnectionError, false);
        },
      );

      test(
        'should return true if type is DioExceptionType.unknown and error is SocketException',
        () {
          // arrange
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.unknown,
            error: const SocketException('message'),
          );

          // assert
          expect(dioException.hasNoConnectionError, true);
        },
      );
    });
  });

  group('ApiFailure', () {
    group('fromStatusCode', () {
      test('should return ApiFailureUnauthorized if statusCode is 401', () {
        // act
        final result = ApiFailure.fromStatusCode(401, endpoint: 'endpoint');

        // assert
        expect(result, isA<ApiFailureUnauthorized>());
      });

      test(
        'should return ApiFailureInvalidStatus if statusCode is between 400 and 499 but different than 401',
        () {
          // act
          final result1 = ApiFailure.fromStatusCode(400, endpoint: 'endpoint');
          final result2 = ApiFailure.fromStatusCode(450, endpoint: 'endpoint');
          final result3 = ApiFailure.fromStatusCode(499, endpoint: 'endpoint');

          // assert
          expect(result1, isA<ApiFailureInvalidStatus>());
          expect(result2, isA<ApiFailureInvalidStatus>());
          expect(result3, isA<ApiFailureInvalidStatus>());
        },
      );

      test(
        'should return ApiFailureServerError if statusCode is between 500 and 599',
        () {
          // act
          final result1 = ApiFailure.fromStatusCode(500, endpoint: 'endpoint');
          final result2 = ApiFailure.fromStatusCode(550, endpoint: 'endpoint');
          final result3 = ApiFailure.fromStatusCode(599, endpoint: 'endpoint');

          // assert
          expect(result1, isA<ApiFailureServer>());
          expect(result2, isA<ApiFailureServer>());
          expect(result3, isA<ApiFailureServer>());
        },
      );

      test(
        'should return ApiFailureUnknown if statusCode is not between 400 and 599',
        () {
          // act
          final result1 = ApiFailure.fromStatusCode(0, endpoint: 'endpoint');
          final result2 = ApiFailure.fromStatusCode(399, endpoint: 'endpoint');
          final result3 = ApiFailure.fromStatusCode(600, endpoint: 'endpoint');

          // assert
          expect(result1, isA<ApiFailureUnknown>());
          expect(result2, isA<ApiFailureUnknown>());
          expect(result3, isA<ApiFailureUnknown>());
        },
      );
    });

    group('fromDioException', () {
      const tEndpoint = 'endpoint';

      test(
        'should return ApiFailureConnection with the passed endpoint if the DioException.hasNoConnectionError is true',
        () {
          // arrange
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.unknown,
            error: const SocketException('message'),
          );

          // act
          final result =
              ApiFailure.fromDioException(dioException, endpoint: tEndpoint);

          // assert
          expect(result, const ApiFailureConnection(endpoint: tEndpoint));
        },
      );

      test(
        'should return ApiFailureConnection with the passed endpoint, exception message and errorCode '
        '"timeout" if exception type is DioExceptionType.connectionTimeout',
        () {
          // arrange
          const tExceptionMessage = 'message';
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.connectionTimeout,
            message: tExceptionMessage,
          );

          // act
          final result =
              ApiFailure.fromDioException(dioException, endpoint: tEndpoint);

          // assert
          expect(
            result,
            const ApiFailureConnection(
              endpoint: tEndpoint,
              errorMessage: tExceptionMessage,
              errorCode: 'timeout',
            ),
          );
        },
      );

      test(
        'should return ApiFailureConnection with the passed endpoint, exception message and errorCode '
        '"receiveTimeout" if exception type is DioExceptionType.receiveTimeout',
        () {
          // arrange
          const tExceptionMessage = 'message';
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.receiveTimeout,
            message: tExceptionMessage,
          );

          // act
          final result =
              ApiFailure.fromDioException(dioException, endpoint: tEndpoint);

          // assert
          expect(
            result,
            const ApiFailureConnection(
              endpoint: tEndpoint,
              errorMessage: tExceptionMessage,
              errorCode: 'receiveTimeout',
            ),
          );
        },
      );

      test(
        'should return ApiFailureConnection with the passed endpoint, exception message and errorCode '
        '"unknownError" if exception type is not DioExceptionType.connectionTimeout or DioExceptionType.receiveTimeout',
        () {
          // arrange
          const tExceptionMessage = 'message';
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            message: tExceptionMessage,
          );

          // act
          final result =
              ApiFailure.fromDioException(dioException, endpoint: tEndpoint);

          // assert
          expect(
            result,
            const ApiFailureConnection(
              endpoint: tEndpoint,
              errorMessage: tExceptionMessage,
              errorCode: 'unknownError',
            ),
          );
        },
      );

      test(
        'should return ApiFailure.fromStatusCode when the DioException.hasNoConnectionError '
        'is false and response is different than null',
        () {
          // arrange
          final dioException = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: RequestOptions(),
              data: {'errorCode': 'error'},
              statusCode: 401,
            ),
          );

          // act
          final result =
              ApiFailure.fromDioException(dioException, endpoint: tEndpoint);

          // assert
          expect(
            result,
            const ApiFailureUnauthorized(
              endpoint: tEndpoint,
              errorCode: 'error',
              statusCode: 401,
            ),
          );
        },
      );
    });
  });
}
