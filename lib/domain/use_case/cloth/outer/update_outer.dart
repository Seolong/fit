import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';

class UpdateOuter {
  final OuterRepository outerRepository;

  UpdateOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.updateOuter(outer);
  }
}