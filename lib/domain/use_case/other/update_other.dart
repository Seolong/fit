import '../../model/other.dart';
import '../../repository/other_repository.dart';

class UpdateOther {
  final OtherRepository otherRepository;

  UpdateOther(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.updateOther(other);
  }
}