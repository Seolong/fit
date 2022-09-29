import '../../model/outer.dart';
import '../../repository/outer_repository.dart';

class UpdateOuter {
  final OuterRepository outerRepository;

  UpdateOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.updateOuter(outer);
  }
}