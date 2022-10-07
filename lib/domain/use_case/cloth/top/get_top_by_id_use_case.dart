import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTopByIdUseCase {
  final TopRepository topRepository;

  GetTopByIdUseCase(this.topRepository);

  Future<Top> call(int id) async {
    return await topRepository.getTopById(id);
  }
}
