import 'package:fit/domain/model/bottom.dart';
import 'package:fit/domain/repository/bottom_repository.dart';

class DeleteBottom{
  final BottomRepository bottomRepository;

  DeleteBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.deleteBottom(bottom);
  }
}