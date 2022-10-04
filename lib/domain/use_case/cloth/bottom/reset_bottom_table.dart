import '../../../model/cloth/bottom.dart';
import '../../../repository/cloth/bottom_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetBottomTable {
  final BottomRepository bottomRepository;

  ResetBottomTable(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.resetBottomTable();
  }
}