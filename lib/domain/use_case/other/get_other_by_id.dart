import 'package:fit/domain/repository/other_repository.dart';

import '../../model/other.dart';

class GetOtherById {
  final OtherRepository otherRepository;

  GetOtherById(this.otherRepository);

  Future<Other> call(int id) async {
    return await otherRepository.getOtherById(id);
  }
}
