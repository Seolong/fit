import '../../../model/cloth/outer.dart';
import '../../../repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetOuterTable {
  final OuterRepository outerRepository;

  ResetOuterTable(this.outerRepository);

  Future<void> call(Outer outer) async {
    await outerRepository.resetOuterTable();
  }
}