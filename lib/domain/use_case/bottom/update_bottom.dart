import 'package:fit/domain/model/bottom.dart';
import 'package:fit/domain/repository/bottom_repository.dart';

class UpdateBottom {
  final BottomRepository bottomRepository;

  UpdateBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.updateBottom(bottom);
  }
}
