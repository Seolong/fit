import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_cloth_category_by_id_use_case.dart';
import 'package:fit/domain/use_case/cloth/other/delete_other_use_case.dart';
import 'package:fit/domain/use_case/cloth/other/get_all_others_use_case.dart';
import 'package:fit/domain/use_case/cloth/other/insert_other_use_case.dart';
import 'package:fit/domain/use_case/cloth/other/update_other_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/util/count_set/get_new_other_id_use_case.dart';

@injectable
class OtherListViewModel with ChangeNotifier {
  final GetNewOtherIdUseCase getNewOtherIdUseCase;
  final InsertOtherUseCase insertOtherUseCase;
  final DeleteOtherUseCase deleteOtherUseCase;
  final UpdateOtherUseCase updateOtherUseCase;
  final GetAllOthersUseCase getAllOthersUseCase;
  final GetClothCategoryByIdUseCase getClothCategoryByIdUseCase;

  bool _enableReorder = false;

  bool get enableReorder => _enableReorder;

  set enableReorder(bool value) {
    _enableReorder = value;
    notifyListeners();
  }

  List<Other> others = [];
  bool _isLongPressed = false;

  bool get isLongPressed => _isLongPressed;

  set isLongPressed(bool value) {
    _isLongPressed = value;
    notifyListeners();
  }

  OtherListViewModel(
    this.getNewOtherIdUseCase,
    this.insertOtherUseCase,
    this.deleteOtherUseCase,
    this.updateOtherUseCase,
    this.getAllOthersUseCase,
    this.getClothCategoryByIdUseCase,
  );

  Future<void> loadOthers(int categoryId) async {
    var allOthers = await getAllOthersUseCase();
    others = allOthers.where((e) => e.categoryId == categoryId).toList();
    others.sort((a, b) => a.order.compareTo(b.order));

    notifyListeners();
  }

  Future<void> addOther({
    required int categoryId,
    required String name,
    required String details,
  }) async {
    int id = await getNewOtherIdUseCase();
    Other other = Other(
      id: id,
      categoryId: categoryId,
      name: name,
      details: details,
      order: id,
    );
    await insertOtherUseCase(other);
    others.add(other);

    notifyListeners();
  }

  Future<void> deleteOther(Other other) async {
    await deleteOtherUseCase(other);
    others.remove(other);

    notifyListeners();
  }

  Future<void> updateOther(Other other) async {
    await updateOtherUseCase(other);
    Other itemInOthers = others.where((e) => e.id == other.id).first;
    int index = others.indexOf(itemInOthers);
    assert(index != -1, 'OtherListViewModel: Any item is not updated.');
    others[index] = other;

    notifyListeners();
  }

  Future<void> reorderOther(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    var item = others.removeAt(oldIndex);
    others.insert(newIndex, item);

    notifyListeners();

    if (oldIndex > newIndex) {
      // 옮겨진 놈의 예전 순서
      int oldOrderOfMovedItem = others[newIndex].order;
      for (int i = newIndex; i < oldIndex; i++) {
        await updateOtherUseCase(
            others[i].copyWith(order: others[i + 1].order));
      }
      await updateOtherUseCase(others[oldIndex].copyWith(order: oldOrderOfMovedItem));
    } else if (oldIndex < newIndex) {
      int oldOrderOfMovedItem = others[newIndex].order;
      for(int i = newIndex; i>oldIndex; i--){
        await updateOtherUseCase(
            others[i].copyWith(order: others[i - 1].order));
      }
      await updateOtherUseCase(others[oldIndex].copyWith(order: oldOrderOfMovedItem));
    } else {
      return;
    }
  }

  Future<String> getCategoryTitle(int id) async {
    ClothCategory clothCategory = await getClothCategoryByIdUseCase(id);
    return clothCategory.title;
  }
}
