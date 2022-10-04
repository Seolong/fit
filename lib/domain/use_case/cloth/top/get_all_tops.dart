import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllTops {
  final TopRepository topRepository;

  GetAllTops(this.topRepository);

  Future<List<Top>> call() async {
    return await topRepository.getAllTops();
  }
}
