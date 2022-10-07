import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateOuterUseCase {
  final OuterRepository outerRepository;

  UpdateOuterUseCase(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.updateOuter(outer);
  }
}