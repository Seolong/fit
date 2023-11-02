import 'package:fit/domain/model/cloth/outer.dart';
import 'package:fit/domain/use_case/cloth/outer/insert_outer_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_outer_id_use_case.dart';
import 'package:fit/util/string_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class OuterSizeColumnViewModel with ChangeNotifier {
  final GetNewOuterIdUseCase getNewOuterIdUseCase;
  final InsertOuterUseCase insertOuterUseCase;

  OuterSizeColumnViewModel(
      this.getNewOuterIdUseCase,
      this.insertOuterUseCase,
      );

  Future<void> addOuter({
    required int categoryId,
    required String name,
    required String totalLength,
    required String shoulderWidth,
    required String chestWidth,
    required String sleeveLength,
  }) async {
    int id = await getNewOuterIdUseCase();
    Outer outer = Outer(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength.convertTextToDouble(),
      shoulderWidth: shoulderWidth.convertTextToDouble(),
      chestWidth: chestWidth.convertTextToDouble(),
      sleeveLength: sleeveLength.convertTextToDouble(),
      order: id,
    );
    await insertOuterUseCase(outer);

    notifyListeners();
  }
}
