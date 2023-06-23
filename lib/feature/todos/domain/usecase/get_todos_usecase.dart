import 'package:injectable/injectable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todos.dart';
import '../repository/todos_repository.dart';

@injectable
class GetTodosUseCase implements UaseCase<DataState<List<TodosEntity>>, void> {
  final TodosRepository _toodosRepository;
  GetTodosUseCase(this._toodosRepository);
  @override
  Future<DataState<List<TodosEntity>>> call({void params}) {
    return _toodosRepository.getTodos();
  }
}
