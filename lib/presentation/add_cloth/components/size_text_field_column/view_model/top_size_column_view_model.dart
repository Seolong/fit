import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/domain/use_case/cloth/top/insert_top_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_top_id_use_case.dart';
import 'package:fit/util/string_helper.dart';
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
    required String totalLength,
    required String shoulderWidth,
    required String chestWidth,
    required String sleeveLength,
  }) async {
    int id = await getNewTopIdUseCase();
    Top top = Top(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength.convertTextToDouble(),
      shoulderWidth: shoulderWidth.convertTextToDouble(),
      chestWidth: chestWidth.convertTextToDouble(),
      sleeveLength: sleeveLength.convertTextToDouble(),
      order: id,
    );
    await insertTopUseCase(top);

    notifyListeners();
  }
}
