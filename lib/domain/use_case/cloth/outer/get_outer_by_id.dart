import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';

class GetOuterById {
  final OuterRepository outerRepository;

  GetOuterById(this.outerRepository);

  Future<Outer> call(int id) async {
    return await outerRepository.getOuterById(id);
  }
}