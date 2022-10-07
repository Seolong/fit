import '../../../model/cloth/other.dart';
import '../../../repository/cloth/other_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateOtherUseCase {
  final OtherRepository otherRepository;

  UpdateOtherUseCase(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.updateOther(other);
  }
}