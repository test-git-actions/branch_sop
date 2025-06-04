import 'package:branch_links/core/clients/api_client/api_client_impl.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late ApiClientImpl apiClient;

  setUp(() {
    mockDio = MockDio();
    apiClient = ApiClientImpl(mockDio);
  });

  group('parse', () {
    test(
      'should return Left(ApiFailureUnknown) when the passed data is null',
      () {
        // act
        final result = apiClient.parse('path', data: null, parser: null);

        // assert
        expect(
          result,
          const Left(
            ApiFailureUnknown(
              endpoint: 'path',
              errorTitle: 'No Data',
            ),
          ),
        );
      },
    );

    test(
      'should return Right(data) when the passed data is not null and parser is null',
      () {
        // act
        final result = apiClient.parse('path', data: 'data', parser: null);

        // assert
        expect(
          result,
          const Right('data'),
        );
      },
    );

    test(
      'should return Right(data) (parsed) when the passed data is not null and parser is not null',
      () {
        // act
        final result = apiClient.parse(
          'path',
          data: {'data': 'data'},
          parser: (json) => json['data'],
        );

        // assert
        expect(
          result,
          const Right('data'),
        );
      },
    );

    test(
      'should return Left(ApiFailureUnknown) when there is a parsing error',
      () {
        // act
        final result = apiClient.parse(
          'path',
          data: 'data',
          parser: (json) => json['data'],
        );

        // assert
        expect(
          result,
          const Left(
            ApiFailureUnknown(
              endpoint: 'path',
              errorTitle: 'Failed to parse the response',
            ),
          ),
        );
      },
    );
  });

  group('request', () {
    const tPath = 'path';
    const tBody = {};
    const tMethod = 'method';
    const tQueryParameters = {'parameter': 'data'};
    const tHeaders = {'headers': 'header'};
    const tResponseType = ResponseType.bytes;
    const tResponseData = 'data';

    void setUpSuccessfulRequest() {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async =>
            Response(requestOptions: RequestOptions(), data: tResponseData),
      );
    }

    void setUpUnsuccessfulRequest(Exception exception) {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenThrow(exception);
    }

    test(
      'should call Dio.request with the correct parameters',
      () async {
        // arrange
        setUpSuccessfulRequest();

        // act
        await apiClient.request(
          tPath,
          body: tBody,
          method: tMethod,
          queryParameters: tQueryParameters,
          headers: tHeaders,
          responseType: tResponseType,
        );

        // assert
        verify(
          () => mockDio.request(
            tPath,
            queryParameters: tQueryParameters,
            options: DioOptions(
              method: tMethod,
              headers: tHeaders,
              responseType: tResponseType,
            ),
            data: tBody,
          ),
        ).called(1);
      },
    );

    test(
      'should return Right(data) from the Response object when the request is successful',
      () async {
        // arrange
        setUpSuccessfulRequest();

        // act
        final result = await apiClient.request(
          tPath,
          body: tBody,
          method: tMethod,
          queryParameters: tQueryParameters,
          headers: tHeaders,
          responseType: tResponseType,
        );

        // assert
        expect(result, const Right(tResponseData));
      },
    );

    test(
      'should return ApiFailure.fromDioException when the request has failed due to DioException',
      () async {
        // arrange
        final tException = DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 400,
          ),
        );
        setUpUnsuccessfulRequest(tException);

        // act
        final result = await apiClient.request(
          tPath,
          body: tBody,
          method: tMethod,
          queryParameters: tQueryParameters,
          headers: tHeaders,
          responseType: tResponseType,
        );

        // assert
        expect(
          result,
          Left(ApiFailure.fromDioException(tException, endpoint: tPath)),
        );
      },
    );

    test(
      'should return ApiFailureUnknown when the request has failed due to an unknown exception',
      () async {
        // arrange
        final tException = Exception();
        setUpUnsuccessfulRequest(tException);

        // act
        final result = await apiClient.request(
          tPath,
          body: tBody,
          method: tMethod,
          queryParameters: tQueryParameters,
          headers: tHeaders,
          responseType: tResponseType,
        );

        // assert
        expect(
          result,
          Left(ApiFailureUnknown(error: tException, endpoint: tPath)),
        );
      },
    );
  });

  group('get', () {
    const tPath = 'path';
    const tResponseData = 'data';

    void setUpSuccessfulRequest() {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async =>
            Response(requestOptions: RequestOptions(), data: tResponseData),
      );
    }

    void setUpUnsuccessfulRequest(Exception exception) {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenThrow(exception);
    }

    test(
      'should return Right(parsed data) when the request is successful',
      () async {
        // arrange
        setUpSuccessfulRequest();

        // act
        final result = await apiClient.get(tPath, parser: null);

        // assert
        expect(result, const Right(tResponseData));
      },
    );

    test(
      'should return Left(ApiFailure) when the request is unsuccessful',
      () async {
        // arrange
        final tException = Exception();
        setUpUnsuccessfulRequest(tException);

        // act
        final result = await apiClient.get(tPath, parser: null);

        // assert
        expect(
          result,
          Left(ApiFailureUnknown(error: tException, endpoint: tPath)),
        );
      },
    );
  });

  group('post', () {
    const tPath = 'path';
    const tResponseData = {'data': 'data'};

    void setUpSuccessfulRequest() {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async =>
            Response(requestOptions: RequestOptions(), data: tResponseData),
      );
    }

    void setUpUnsuccessfulRequest(Exception exception) {
      when(
        () => mockDio.request(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
          data: any(named: 'data'),
        ),
      ).thenThrow(exception);
    }

    test(
      'should return Right(parsed data) when the request is successful',
      () async {
        // arrange
        setUpSuccessfulRequest();

        // act
        final result = await apiClient
            .post(tPath, parser: (json) => json['data'], body: {});

        // assert
        expect(result, Right(tResponseData['data']));
      },
    );

    test(
      'should return Left(ApiFailure) when the request is unsuccessful',
      () async {
        // arrange
        final tException = Exception();
        setUpUnsuccessfulRequest(tException);

        // act
        final result = await apiClient
            .post(tPath, parser: (json) => json['data'], body: {});

        // assert
        expect(
          result,
          Left(ApiFailureUnknown(error: tException, endpoint: tPath)),
        );
      },
    );
  });
}
