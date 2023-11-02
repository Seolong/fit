import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/use_case/cloth/bottom/insert_bottom_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_bottom_id_use_case.dart';
import 'package:fit/util/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class BottomSizeColumnViewModel with ChangeNotifier {
  final GetNewBottomIdUseCase getNewBottomIdUseCase;
  final InsertBottomUseCase insertBottomUseCase;

  BottomSizeColumnViewModel(
    this.getNewBottomIdUseCase,
    this.insertBottomUseCase,
  );

  Future<void> addBottom({
    required int categoryId,
    required String name,
    required String totalLength,
    required String waist,
    required String thigh,
    required String legOpening,
    required String rise,
  }) async {
    int id = await getNewBottomIdUseCase();
    Bottom bottom = Bottom(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength.convertTextToDouble(),
      waist: waist.convertTextToDouble(),
      thigh: thigh.convertTextToDouble(),
      legOpening: legOpening.convertTextToDouble(),
      rise: rise.convertTextToDouble(),
      order: id,
    );
    await insertBottomUseCase(bottom);

    notifyListeners();
  }
}
