import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/api_path.dart';
import '../../models/todos_model.dart';
import 'package:dio/dio.dart';
part 'todos_api_service.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiPath.baseUrl)
abstract class TodosApiService {
  @factoryMethod
  factory TodosApiService(Dio dio) = _TodosApiService;

  @GET(ApiPath.todos)
  Future<HttpResponse<List<TodosModel>>> getTodos();
}
