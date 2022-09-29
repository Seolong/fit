import 'package:fit/domain/repository/top_repository.dart';

import '../../model/top.dart';

class UpdateTop{
  final TopRepository topRepository;

  UpdateTop(this.topRepository);

  Future<void> call(Top top) async {
    await topRepository.updateTop(top);
  }
}