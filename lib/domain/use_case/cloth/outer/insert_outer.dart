import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';

class InsertOuter {
  final OuterRepository outerRepository;

  InsertOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.insertOuter(outer);
  }
}