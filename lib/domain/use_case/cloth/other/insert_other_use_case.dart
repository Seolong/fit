import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/repository/cloth/other_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertOtherUseCase {
  final OtherRepository otherRepository;

  InsertOtherUseCase(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.insertOther(other);
  }
}
