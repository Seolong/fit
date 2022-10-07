import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOuterByIdUseCase {
  final OuterRepository outerRepository;

  GetOuterByIdUseCase(this.outerRepository);

  Future<Outer> call(int id) async {
    return await outerRepository.getOuterById(id);
  }
}