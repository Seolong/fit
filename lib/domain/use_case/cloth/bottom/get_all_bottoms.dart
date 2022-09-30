import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/repository/cloth/bottom_repository.dart';

class GetAllBottoms{
  final BottomRepository bottomRepository;

  GetAllBottoms(this.bottomRepository);

  Future<List<Bottom>> call() async {
    return await bottomRepository.getAllBottoms();
  }
}