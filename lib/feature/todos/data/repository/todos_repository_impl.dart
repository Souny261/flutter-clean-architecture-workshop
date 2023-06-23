import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:workshop/feature/todos/data/models/todos_model.dart';
import 'package:workshop/core/resources/data_state.dart';
import '../../domain/repository/todos_repository.dart';
import '../data_sources/remote/todos_api_service.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: TodosRepository)
class TodosRepositoryImpl implements TodosRepository {
  final TodosApiService _todosApiService;
  TodosRepositoryImpl(this._todosApiService);

  @override
  Future<DataState<List<TodosModel>>> getTodos() async {
    try {
      final httpResponse = await _todosApiService.getTodos();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        // ignore: deprecated_member_use
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            // ignore: deprecated_member_use
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
