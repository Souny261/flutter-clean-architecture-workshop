part of 'todos_cubit.dart';
enum TodosStateStatus { initial, loading, success, error }
@freezed
class TodosState with _$TodosState {
  factory TodosState({
    List<TodosEntity>? todos,
    TodosStateStatus? status,
    String? errorStateMessage,
  }) = _TodosState;
  const TodosState._();
  factory TodosState.initial() => TodosState(
        todos: [],
        status: TodosStateStatus.initial,
        errorStateMessage: "",
      );
}
