import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllTopsUseCase {
  final TopRepository topRepository;

  GetAllTopsUseCase(this.topRepository);

  Future<List<Top>> call() async {
    return await topRepository.getAllTops();
  }
}
