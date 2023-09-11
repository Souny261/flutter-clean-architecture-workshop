import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:workshop/feature/todos/data/models/todos_model.dart';
import 'package:workshop/core/resources/data_state.dart';
import 'package:workshop/feature/todos/domain/entities/todos.dart';
import '../../../../config/database/app_database.dart';
import '../../domain/repository/todos_repository.dart';
import '../data_sources/remote/todos_api_service.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: TodosRepository)
class TodosRepositoryImpl implements TodosRepository {
  final TodosApiService _todosApiService;
  final AppDatabase _appDatabase;
  TodosRepositoryImpl(this._todosApiService, this._appDatabase);

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
      log("DioError: ${e.type}");
      log("Message: ${e.message}");
      log("offlineData");
      var offlineData = await _appDatabase.todosDAO.getTodos();
      List<TodosModel> todosModels = offlineData.map((entity) {
        return TodosModel(
            id: entity.id,
            title: entity.title,
            completed: entity.completed,
            userId: entity.userId);
      }).toList();
      return DataSuccess(todosModels);
    }
  }

  @override
  Future<List<TodosEntity>> getSavedTodos() {
    return _appDatabase.todosDAO.getTodos();
  }

  @override
  Future<void> removeTodo(TodosEntity todo) {
    return _appDatabase.todosDAO.deleteTodos(todo);
  }

  @override
  Future<void> saveTodo(TodosEntity todo) {
    return _appDatabase.todosDAO.insertTodos(todo);
  }
}
