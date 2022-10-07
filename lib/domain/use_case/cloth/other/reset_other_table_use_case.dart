import '../../../model/cloth/other.dart';
import '../../../repository/cloth/other_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetOtherTableUseCase {
  final OtherRepository otherRepository;

  ResetOtherTableUseCase(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.resetOtherTable();
  }
}