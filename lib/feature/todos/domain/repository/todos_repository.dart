import '../../../../core/resources/data_state.dart';
import '../entities/todos.dart';

abstract class TodosRepository {
  Future<DataState<List<TodosEntity>>> getTodos();
}
