import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/repository/cloth/other_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOthersUseCase {
  final OtherRepository otherRepository;

  GetAllOthersUseCase(this.otherRepository);

  Future<List<Other>> call() async {
    return await otherRepository.getAllOthers();
  }
}
