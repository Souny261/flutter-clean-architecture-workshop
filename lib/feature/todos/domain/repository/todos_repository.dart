import '../../../../core/resources/data_state.dart';
import '../entities/todos.dart';

abstract class TodosRepository {
  // Remote
  Future<DataState<List<TodosEntity>>> getTodos();
  // Local
  Future<List<TodosEntity>> getSavedTodos();
  Future<void> saveTodo(TodosEntity todo);
  Future<void> removeTodo(TodosEntity todo);
}
