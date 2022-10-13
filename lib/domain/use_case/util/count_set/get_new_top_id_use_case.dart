import 'package:injectable/injectable.dart';

import '../../../repository/util/count_set_repository.dart';

@injectable
class GetNewTopIdUseCase {
  final CountSetRepository countSetRepository;

  GetNewTopIdUseCase(this.countSetRepository);

  Future<int> call() async {
    return await countSetRepository.getNewTopId();
  }
}