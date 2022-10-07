import 'package:injectable/injectable.dart';

import '../../../repository/util/count_set_repository.dart';

@injectable
class GetNewCategoryIdUseCase {
  final CountSetRepository countSetRepository;

  GetNewCategoryIdUseCase(this.countSetRepository);

  Future<int> call() async {
    return await countSetRepository.getNewCategoryId();
  }
}