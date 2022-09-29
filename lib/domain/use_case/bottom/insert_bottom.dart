import 'package:fit/domain/repository/bottom_repository.dart';

import '../../model/bottom.dart';

class InsertBottom{
  final BottomRepository bottomRepository;

  InsertBottom(this.bottomRepository);

  Future<void> call(Bottom bottom) async {
    await bottomRepository.insertBottom(bottom);
  }
}