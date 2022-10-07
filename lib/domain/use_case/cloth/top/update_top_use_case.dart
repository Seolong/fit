import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTopUseCase {
  final TopRepository topRepository;

  UpdateTopUseCase(this.topRepository);

  Future<void> call(Top top) async {
    await topRepository.updateTop(top);
  }
}
