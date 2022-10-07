import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllOutersUseCase {
  final OuterRepository outerRepository;

  GetAllOutersUseCase(this.outerRepository);

  Future<List<Outer>> call() async {
    return await outerRepository.getAllOuters();
  }
}