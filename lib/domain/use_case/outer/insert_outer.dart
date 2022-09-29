import '../../model/outer.dart';
import '../../repository/outer_repository.dart';

class InsertOuter {
  final OuterRepository outerRepository;

  InsertOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.insertOuter(outer);
  }
}