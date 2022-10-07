import '../../../model/cloth/bottom.dart';
import '../../../repository/cloth/bottom_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetBottomTableUseCase {
  final BottomRepository bottomRepository;

  ResetBottomTableUseCase(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.resetBottomTable();
  }
}