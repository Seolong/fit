import 'package:injectable/injectable.dart';

import '../../../repository/util/count_set_repository.dart';

@injectable
class GetNewOtherIdUseCase {
  final CountSetRepository countSetRepository;

  GetNewOtherIdUseCase(this.countSetRepository);

  Future<int> call() async {
    return await countSetRepository.getNewOtherId();
  }
}