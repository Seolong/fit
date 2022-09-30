import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';

class UpdateTop{
  final TopRepository topRepository;

  UpdateTop(this.topRepository);

  Future<void> call(Top top) async {
    await topRepository.updateTop(top);
  }
}