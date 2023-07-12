import 'package:floor/floor.dart';
import 'package:workshop/feature/todos/domain/entities/todos.dart';

@dao
abstract class TodosDao {
  @insert
  Future<void> insertTodos(TodosEntity todo);
  @delete
  Future<void> deleteTodos(TodosEntity todo);

  @Query("SELECT * FROM todos")
  Future<List<TodosEntity>> getTodos();
}
