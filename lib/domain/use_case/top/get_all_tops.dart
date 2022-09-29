import 'package:fit/domain/repository/top_repository.dart';

import '../../model/top.dart';

class GetAllTops {
  final TopRepository topRepository;

  GetAllTops(this.topRepository);

  Future<List<Top>> call() async {
    return await topRepository.getAllTops();
  }
}
