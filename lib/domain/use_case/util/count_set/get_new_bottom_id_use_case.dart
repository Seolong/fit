import 'package:injectable/injectable.dart';

import '../../../repository/util/count_set_repository.dart';

@injectable
class GetNewBottomIdUseCase {
  final CountSetRepository countSetRepository;

  GetNewBottomIdUseCase(this.countSetRepository);

  Future<int> call() async {
    return await countSetRepository.getNewBottomId();
  }
}