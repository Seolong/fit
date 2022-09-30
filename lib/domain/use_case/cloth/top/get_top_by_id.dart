import '../../../model/cloth/top.dart';
import '../../../repository/cloth/top_repository.dart';

class GetTopById{
  final TopRepository topRepository;

  GetTopById(this.topRepository);

  Future<Top> call(int id) async{
    return await topRepository.getTopById(id);
  }
}