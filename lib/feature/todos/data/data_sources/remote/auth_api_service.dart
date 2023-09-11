import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "https://api.test.move.kokkok.asia")
abstract class AuthApiService {
  @factoryMethod
  factory AuthApiService(Dio dio) = _AuthApiService;

  @GET("/api/v1/customers/oauth/notification/list/query")
  Future<HttpResponse<dynamic>> getDataWithBearerAndQuery(
    @Header('Authorization') String token,
    @Query("page") String page,
    @Query("limit") String limit,
  );
}
