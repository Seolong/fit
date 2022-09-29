import '../../model/outer.dart';
import '../../repository/outer_repository.dart';

class GetAllOuters {
  final OuterRepository outerRepository;

  GetAllOuters(this.outerRepository);

  Future<List<Outer>> call() async {
    return await outerRepository.getAllOuters();
  }
}