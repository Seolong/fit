import 'package:fit/domain/repository/cloth/other_repository.dart';

import '../../../model/cloth/other.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOtherById {
  final OtherRepository otherRepository;

  GetOtherById(this.otherRepository);

  Future<Other> call(int id) async {
    return await otherRepository.getOtherById(id);
  }
}
