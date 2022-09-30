import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';

class DeleteOuter {
  final OuterRepository outerRepository;

  DeleteOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.deleteOuter(outer);
  }
}