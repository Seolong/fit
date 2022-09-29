import 'package:fit/domain/model/other.dart';
import 'package:fit/domain/repository/other_repository.dart';

class DeleteOther {
  final OtherRepository otherRepository;

  DeleteOther(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.deleteOther(other);
  }
}
