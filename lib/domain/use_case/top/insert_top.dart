import 'package:fit/domain/repository/top_repository.dart';

import '../../model/top.dart';

class InsertTop{
  final TopRepository topRepository;

  InsertTop(this.topRepository);

  Future<void> call(Top top)async{
    await topRepository.insertTop(top);
  }
}