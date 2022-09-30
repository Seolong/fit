import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/repository/cloth/other_repository.dart';

class DeleteOther {
  final OtherRepository otherRepository;

  DeleteOther(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.deleteOther(other);
  }
}