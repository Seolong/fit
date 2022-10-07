import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertTopUseCase {
  final TopRepository topRepository;

  InsertTopUseCase(this.topRepository);

  Future<void> call(Top top) async {
    await topRepository.insertTop(top);
  }
}
