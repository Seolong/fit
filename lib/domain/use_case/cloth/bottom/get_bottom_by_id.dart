import 'package:fit/domain/repository/cloth/bottom_repository.dart';

import '../../../model/cloth/bottom.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBottomById{
  final BottomRepository bottomRepository;

  GetBottomById(this.bottomRepository);

  Future<Bottom> call(int id) async {
    return await bottomRepository.getBottomById(id);
  }
}