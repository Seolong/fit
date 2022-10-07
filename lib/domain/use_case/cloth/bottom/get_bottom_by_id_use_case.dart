import 'package:fit/domain/repository/cloth/bottom_repository.dart';

import '../../../model/cloth/bottom.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBottomByIdUseCase {
  final BottomRepository bottomRepository;

  GetBottomByIdUseCase(this.bottomRepository);

  Future<Bottom> call(int id) async {
    return await bottomRepository.getBottomById(id);
  }
}
