import 'package:fit/domain/repository/top_repository.dart';

import '../../model/top.dart';

class GetTopById{
  final TopRepository topRepository;

  GetTopById(this.topRepository);

  Future<Top> call(int id) async{
    return await topRepository.getTopById(id);
  }
}