import 'package:fit/domain/model/other.dart';
import 'package:fit/domain/repository/other_repository.dart';

class InsertOther {
  final OtherRepository otherRepository;

  InsertOther(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.insertOther(other);
  }
}
