import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';

class GetAllTops {
  final TopRepository topRepository;

  GetAllTops(this.topRepository);

  Future<List<Top>> call() async {
    return await topRepository.getAllTops();
  }
}
