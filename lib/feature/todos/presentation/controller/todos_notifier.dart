import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:workshop/feature/todos/presentation/controller/todos_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../config/DI/configure_dependencies.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/todos.dart';
import '../../domain/usecase/get_saved_todos.dart';
import '../../domain/usecase/get_todos_usecase.dart';
import '../../domain/usecase/remove_todo.dart';
import '../../domain/usecase/save_todo.dart';

final todoNotifier = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  return TodoNotifier(getIt(), getIt(), getIt(), getIt());
});

@injectable
class TodoNotifier extends StateNotifier<TodoState> {
  final GetTodosUseCase _getTodosUseCase;
  final GetSavedTodosUseCase _getTodosSavesUseCase;
  final SaveTodosUseCase _saveTodosUseCase;
  final RemoveTodosUseCase _removeTodosUseCase;
  TodoNotifier(this._getTodosUseCase, this._getTodosSavesUseCase,
      this._saveTodosUseCase, this._removeTodosUseCase)
      : super(TodoState.initial()) {
    log("Start Todo Notifier");
    fetchTodo();
  }

  Future<void> fetchTodo() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataState = await _getTodosUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      state = state.copyWith(todos: dataState.data);
    }
    if (dataState is DataFailed) {
      log("Error: ${dataState.error}");
    }
  }

  Future<void> savedTodo(TodosEntity todosEntity) async {
    _saveTodosUseCase(params: todosEntity);
    // fecthTodoSaved();
  }

  Future<void> fecthTodoSaved() async {
    final result = await _getTodosSavesUseCase();
    state = state.copyWith(savedTodosList: result);
  }

  Future<void> removeTodo(TodosEntity todosEntity) async {
    _removeTodosUseCase(params: todosEntity);
    fecthTodoSaved();
  }
}
