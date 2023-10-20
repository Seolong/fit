import 'package:fit/domain/use_case/category/cloth_category/get_cloth_category_by_id_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_bottom_id_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category/cloth_category.dart';
import '../../domain/model/cloth/bottom.dart';
import '../../domain/use_case/cloth/bottom/delete_bottom_use_case.dart';
import '../../domain/use_case/cloth/bottom/get_all_bottoms_use_case.dart';
import '../../domain/use_case/cloth/bottom/get_bottom_by_id_use_case.dart';
import '../../domain/use_case/cloth/bottom/insert_bottom_use_case.dart';
import '../../domain/use_case/cloth/bottom/update_bottom_use_case.dart';

@injectable
class BottomListViewModel with ChangeNotifier {
  BottomListViewModel(
    this.insertBottomUseCase,
    this.deleteBottomUseCase,
    this.updateBottomUseCase,
    this.getBottomByIdUseCase,
    this.getAllBottomsUseCase,
    this.getNewBottomIdUseCase,
    this.getClothCategoryByIdUseCase,
  );

  final InsertBottomUseCase insertBottomUseCase;
  final DeleteBottomUseCase deleteBottomUseCase;
  final UpdateBottomUseCase updateBottomUseCase;
  final GetBottomByIdUseCase getBottomByIdUseCase;
  final GetAllBottomsUseCase getAllBottomsUseCase;
  final GetNewBottomIdUseCase getNewBottomIdUseCase;
  final GetClothCategoryByIdUseCase getClothCategoryByIdUseCase;

  bool _enableReorder = false;

  bool get enableReorder => _enableReorder;

  set enableReorder(bool value) {
    _enableReorder = value;
    notifyListeners();
  }

  List<Bottom> bottoms = [];
  bool _isLongPressed = false;

  bool get isLongPressed => _isLongPressed;

  set isLongPressed(bool value) {
    _isLongPressed = value;
    notifyListeners();
  }

  Future<void> loadBottoms(int categoryId) async {
    var allBottoms = await getAllBottomsUseCase();
    bottoms = allBottoms.where((e) => e.categoryId == categoryId).toList();
    bottoms.sort((a, b) => a.order.compareTo(b.order));

    notifyListeners();
  }

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
    bottoms.add(bottom);

    notifyListeners();
  }

  Future<void> deleteBottom(Bottom bottom) async {
    await deleteBottomUseCase(bottom);
    bottoms.remove(bottom);

    notifyListeners();
  }

  Future<void> updateBottom(Bottom bottom) async {
    await updateBottomUseCase(bottom);
    Bottom itemInBottoms = bottoms.where((e) => e.id == bottom.id).first;
    int index = bottoms.indexOf(itemInBottoms);
    assert(index != -1, 'BottomListViewModel: Any item is not updated.');
    bottoms[index] = bottom;

    notifyListeners();
  }

  Future<String> getCategoryTitle(int id) async {
    ClothCategory clothCategory = await getClothCategoryByIdUseCase(id);
    return clothCategory.title;
  }

  Future<void> reorderBottom(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    var item = bottoms.removeAt(oldIndex);
    bottoms.insert(newIndex, item);

    notifyListeners();

    if (oldIndex > newIndex) {
      // 옮겨진 놈의 예전 순서
      int oldOrderOfMovedItem = bottoms[newIndex].order;
      for (int i = newIndex; i < oldIndex; i++) {
        await updateBottomUseCase(
            bottoms[i].copyWith(order: bottoms[i + 1].order));
      }
      await updateBottomUseCase(bottoms[oldIndex].copyWith(order: oldOrderOfMovedItem));
    } else if (oldIndex < newIndex) {
      int oldOrderOfMovedItem = bottoms[newIndex].order;
      for(int i = newIndex; i>oldIndex; i--){
        await updateBottomUseCase(
            bottoms[i].copyWith(order: bottoms[i - 1].order));
      }
      await updateBottomUseCase(bottoms[oldIndex].copyWith(order: oldOrderOfMovedItem));
    } else {
      return;
    }
  }
}
