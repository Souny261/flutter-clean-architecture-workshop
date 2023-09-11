import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workshop/config/database/app_database.dart';
import 'package:workshop/core/middleware/interceptors.dart';

@module
abstract class AppModule {
  @preResolve
  Future<AppDatabase> get database =>
      $FloorAppDatabase.databaseBuilder('app_database.db').build();

  @lazySingleton
  Dio dio(@Named('appInterceptors') AppInterceptors appInterceptors) {
    final dio = Dio();
    dio.interceptors.add(appInterceptors);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      maxWidth: 150,
      error: true,
      requestBody: true,
    ));
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError e, handler) async {
          if (e.response?.statusCode == 401) {
            // If a 401 response is received, refresh the access token
            String newAccessToken = await refreshToken();
            // Update the request header with the new access token
            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            // Repeat the request with the updated header
            return handler.resolve(await dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}

Future<String> refreshToken() async {
  log("Refresh Token");
  return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTU5NTQ5NTQsImp0aSI6IjEwMyIsImlhdCI6MTY5MzM2Mjk1NCwiaXNzIjoiMTAzIn0.9FrUYHumYOvdeR_Pkcl3qMdRzCvf17VI5X7K_lrB6v8';
}
