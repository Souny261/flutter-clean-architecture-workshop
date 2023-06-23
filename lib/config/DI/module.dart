import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:workshop/core/middleware/interceptors.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio dio(@Named('appInterceptors') AppInterceptors appInterceptors) {
    final dio = Dio();
    dio.interceptors.add(appInterceptors);
    return dio;
  }
}
