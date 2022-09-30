import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';

class GetAllOuters {
  final OuterRepository outerRepository;

  GetAllOuters(this.outerRepository);

  Future<List<Outer>> call() async {
    return await outerRepository.getAllOuters();
  }
}