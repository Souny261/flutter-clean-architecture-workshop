import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workshop/feature/todos/domain/entities/todos.dart';

part 'todos_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  factory TodoState({
    List<TodosEntity>? todos,
    List<TodosEntity>? savedTodosList,
  }) = _TodoState;
  const TodoState._();
  factory TodoState.initial() => TodoState(todos: [], savedTodosList: []);
}
