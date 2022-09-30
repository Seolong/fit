import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/repository/cloth/other_repository.dart';

class GetAllOthers {
  final OtherRepository otherRepository;

  GetAllOthers(this.otherRepository);

  Future<List<Other>> call() async {
    return await otherRepository.getAllOthers();
  }
}
