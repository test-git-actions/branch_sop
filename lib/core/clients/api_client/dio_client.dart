import 'package:dio/dio.dart';

class DioClient {
  static final _dio = Dio(BaseOptions());
  static Dio get instance => _dio;
}
