import 'package:fit/domain/model/other.dart';
import 'package:fit/domain/repository/other_repository.dart';

class GetAllOthers {
  final OtherRepository otherRepository;

  GetAllOthers(this.otherRepository);

  Future<List<Other>> call() async {
    return await otherRepository.getAllOthers();
  }
}
