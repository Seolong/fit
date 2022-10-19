import 'package:injectable/injectable.dart';

import '../../../repository/util/count_set_repository.dart';

@injectable
class GetNewOuterIdUseCase {
  final CountSetRepository countSetRepository;

  GetNewOuterIdUseCase(this.countSetRepository);

  Future<int> call() async {
    return await countSetRepository.getNewOuterId();
  }
}