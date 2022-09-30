import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';

class InsertTop{
  final TopRepository topRepository;

  InsertTop(this.topRepository);

  Future<void> call(Top top)async{
    await topRepository.insertTop(top);
  }
}