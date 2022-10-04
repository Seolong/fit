import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/repository/cloth/bottom_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteBottom{
  final BottomRepository bottomRepository;

  DeleteBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.deleteBottom(bottom);
  }
}