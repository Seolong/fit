import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/use_case/cloth/bottom/insert_bottom_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_bottom_id_use_case.dart';
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
    required double totalLength,
    required double waist,
    required double thigh,
    required double legOpening,
    required double rise,
  }) async {
    int id = await getNewBottomIdUseCase();
    Bottom bottom = Bottom(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      waist: waist,
      thigh: thigh,
      legOpening: legOpening,
      rise: rise,
      order: id,
    );
    await insertBottomUseCase(bottom);

    notifyListeners();
  }
}
