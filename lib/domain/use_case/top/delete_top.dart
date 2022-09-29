import 'package:fit/domain/repository/top_repository.dart';

import '../../model/top.dart';

class DeleteTop{
  final TopRepository topRepository;

  DeleteTop(this.topRepository);

  Future<void> call(Top top) async{
    await topRepository.deleteTop(top);
  }
}