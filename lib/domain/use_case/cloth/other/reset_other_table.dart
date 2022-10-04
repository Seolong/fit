import '../../../model/cloth/other.dart';
import '../../../repository/cloth/other_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetOtherTable {
  final OtherRepository otherRepository;

  ResetOtherTable(this.otherRepository);

  Future<void> call(Other other) async {
    await otherRepository.resetOtherTable();
  }
}