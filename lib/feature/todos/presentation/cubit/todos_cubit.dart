import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/todos.dart';
import '../../domain/usecase/get_todos_usecase.dart';

part 'todos_state.dart';
part 'todos_cubit.freezed.dart';

@injectable
class TodosCubit extends Cubit<TodosState> {
  final GetTodosUseCase _getTodosUseCase;
  TodosCubit(this._getTodosUseCase) : super(TodosState.initial()) {
    log("Start TodosCubit");
    fetchTodo();
  }
  Future<void> fetchTodo() async {
    emit(state.copyWith(status: TodosStateStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    final dataState = await _getTodosUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(state.copyWith(
          status: TodosStateStatus.success, todos: dataState.data));
    }
    if (dataState is DataFailed) {
      log("Error: ${dataState.error!.message}");
      emit(state.copyWith(
          status: TodosStateStatus.error,
          errorStateMessage: dataState.error!.message));
    }
  }
}
