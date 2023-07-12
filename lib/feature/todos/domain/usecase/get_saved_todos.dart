import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/todos.dart';
import '../repository/todos_repository.dart';

@injectable
class GetSavedTodosUseCase implements UaseCase<List<TodosEntity>, void> {
  final TodosRepository _toodosRepository;
  GetSavedTodosUseCase(this._toodosRepository);
  @override
  Future<List<TodosEntity>> call({void params}) {
    return _toodosRepository.getSavedTodos();
  }
}
