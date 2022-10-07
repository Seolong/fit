import 'package:fit/domain/repository/cloth/bottom_repository.dart';

import '../../../model/cloth/bottom.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertBottomUseCase {
  final BottomRepository bottomRepository;

  InsertBottomUseCase(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.insertBottom(bottom);
  }
}
