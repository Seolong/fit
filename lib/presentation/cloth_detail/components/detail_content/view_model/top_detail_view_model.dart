import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/model/cloth/top.dart';
import '../../../../../domain/use_case/cloth/top/delete_top_use_case.dart';
import '../../../../../domain/use_case/cloth/top/get_top_by_id_use_case.dart';
import '../../../../../domain/use_case/cloth/top/update_top_use_case.dart';

@injectable
class TopDetailViewModel with ChangeNotifier{
  final DeleteTopUseCase deleteTopUseCase;
  final UpdateTopUseCase updateTopUseCase;
  final GetTopByIdUseCase getTopByIdUseCase;

  TopDetailViewModel(
    this.deleteTopUseCase,
    this.updateTopUseCase,
    this.getTopByIdUseCase,
  );

  Future<void> deleteTopById(int id) async {
    Top top = await getTopByIdUseCase(id);
    await deleteTopUseCase(top);
  }

  Future<void> updateTop(Top top) async {

  }

  Future<Top> getTop(int id) async {
    return getTopByIdUseCase(id);
  }
}