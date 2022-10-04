import '../../../repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetTopTable{
  final TopRepository topRepository;

  ResetTopTable(this.topRepository);

  Future<void> call() async {
    await topRepository.resetTopTable();
  }
}