import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetTopTableUseCase {
  final TopRepository topRepository;

  ResetTopTableUseCase(this.topRepository);

  Future<void> call() async {
    await topRepository.resetTopTable();
  }
}
