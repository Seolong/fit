import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';

class DeleteTop{
  final TopRepository topRepository;

  DeleteTop(this.topRepository);

  Future<void> call(Top top) async{
    await topRepository.deleteTop(top);
  }
}