import 'package:fit/domain/repository/bottom_repository.dart';

import '../../model/bottom.dart';

class GetBottomById{
  final BottomRepository bottomRepository;

  GetBottomById(this.bottomRepository);

  Future<Bottom> call(int id) async {
    return await bottomRepository.getBottomById(id);
  }
}