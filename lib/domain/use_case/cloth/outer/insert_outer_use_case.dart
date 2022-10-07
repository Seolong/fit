import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertOuterUseCase {
  final OuterRepository outerRepository;

  InsertOuterUseCase(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.insertOuter(outer);
  }
}