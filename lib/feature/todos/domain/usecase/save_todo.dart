import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/todos.dart';
import '../repository/todos_repository.dart';

@injectable
class SaveTodosUseCase implements UaseCase<void, TodosEntity> {
  final TodosRepository _toodosRepository;
  SaveTodosUseCase(this._toodosRepository);

  @override
  Future<void> call({TodosEntity? params}) {
    return _toodosRepository.saveTodo(params!);
  }
}
