import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/todos.dart';
import '../repository/todos_repository.dart';

@injectable
class RemoveTodosUseCase implements UaseCase<void, TodosEntity> {
  final TodosRepository _toodosRepository;
  RemoveTodosUseCase(this._toodosRepository);

  @override
  Future<void> call({TodosEntity? params}) {
    return _toodosRepository.removeTodo(params!);
  }
}
