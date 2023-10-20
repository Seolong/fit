import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/domain/use_case/cloth/top/insert_top_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_top_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class TopSizeColumnViewModel with ChangeNotifier {
  final GetNewTopIdUseCase getNewTopIdUseCase;
  final InsertTopUseCase insertTopUseCase;

  TopSizeColumnViewModel(
      this.getNewTopIdUseCase,
      this.insertTopUseCase,
      );

  Future<void> addTop({
    required int categoryId,
    required String name,
    required double totalLength,
    required double shoulderWidth,
    required double chestWidth,
    required double sleeveLength,
  }) async {
    int id = await getNewTopIdUseCase();
    Top top = Top(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
      order: id,
    );
    await insertTopUseCase(top);

    notifyListeners();
  }
}
