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
    return dio;
  }
}
