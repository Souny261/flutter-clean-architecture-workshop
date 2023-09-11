import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:workshop/feature/todos/data/data_sources/remote/auth_api_service.dart';
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
  final AuthApiService _authApiService;
  final AppDatabase _appDatabase;
  TodosRepositoryImpl(
      this._todosApiService, this._appDatabase, this._authApiService);

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

  @override
  Future<DataState> getDataWithBearerAndQuery() async {
    try {
      log("getDataWithBearerAndQuery");
      String token =
          "eeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2OTU5NTQ5NTQsImp0aSI6IjEwMyIsImlhdCI6MTY5MzM2Mjk1NCwiaXNzIjoiMTAzIn0.9FrUYHumYOvdeR_Pkcl3qMdRzCvf17VI5X7K_lrB6v8";
      final httpResponse = await _authApiService.getDataWithBearerAndQuery(
          "Bearer $token", "1", "10");
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
}
