import '../../model/outer.dart';
import '../../repository/outer_repository.dart';

class DeleteOuter {
  final OuterRepository outerRepository;

  DeleteOuter(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.deleteOuter(outer);
  }
}