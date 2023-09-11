import 'package:injectable/injectable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/todos.dart';
import '../repository/todos_repository.dart';

@injectable
class GetWithAuthUseCase implements UaseCase<DataState<dynamic>, void> {
  final TodosRepository _toodosRepository;
  GetWithAuthUseCase(this._toodosRepository);
  @override
  Future<DataState<dynamic>> call({void params}) {
    return _toodosRepository.getDataWithBearerAndQuery();
  }
}
