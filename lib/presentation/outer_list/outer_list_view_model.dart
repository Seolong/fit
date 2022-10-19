import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_cloth_category_by_id_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/cloth/outer.dart';
import '../../domain/use_case/cloth/outer/delete_outer_use_case.dart';
import '../../domain/use_case/cloth/outer/get_all_outers_use_case.dart';
import '../../domain/use_case/cloth/outer/insert_outer_use_case.dart';
import '../../domain/use_case/cloth/outer/update_outer_use_case.dart';
import '../../domain/use_case/util/count_set/get_new_outer_id_use_case.dart';

@injectable
class OuterListViewModel with ChangeNotifier {
  final GetNewOuterIdUseCase getNewOuterIdUseCase;
  final InsertOuterUseCase insertOuterUseCase;
  final DeleteOuterUseCase deleteOuterUseCase;
  final UpdateOuterUseCase updateOuterUseCase;
  final GetAllOutersUseCase getAllOutersUseCase;
  final GetClothCategoryByIdUseCase getClothCategoryByIdUseCase;

  bool _enableReorder = false;

  bool get enableReorder => _enableReorder;

  set enableReorder(bool value) {
    _enableReorder = value;
    notifyListeners();
  }

  List<Outer> outers = [];
  bool _isLongPressed = false;

  bool get isLongPressed => _isLongPressed;

  set isLongPressed(bool value) {
    _isLongPressed = value;
    notifyListeners();
  }

  OuterListViewModel(
    this.getNewOuterIdUseCase,
    this.insertOuterUseCase,
    this.deleteOuterUseCase,
    this.updateOuterUseCase,
    this.getAllOutersUseCase,
    this.getClothCategoryByIdUseCase,
  );

  Future<void> loadOuters(int categoryId) async {
    var allOuters = await getAllOutersUseCase();
    outers = allOuters.where((e) => e.categoryId == categoryId).toList();

    notifyListeners();
  }

  Future<void> addOuter({
    required int categoryId,
    required String name,
    required double totalLength,
    required double shoulderWidth,
    required double chestWidth,
    required double sleeveLength,
  }) async {
    int id = await getNewOuterIdUseCase();
    Outer outer = Outer(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
      order: id,
    );
    await insertOuterUseCase(outer);
    outers.add(outer);

    notifyListeners();
  }

  Future<void> deleteOuter(Outer top) async {
    await deleteOuterUseCase(top);
    outers.remove(top);

    notifyListeners();
  }

  Future<void> updateOuter(Outer top) async {
    await updateOuterUseCase(top);
    Outer itemInOuters = outers.where((e) => e.id == top.id).first;
    int index = outers.indexOf(itemInOuters);
    assert(index != -1, 'OuterListViewModel: Any item is not updated.');
    outers[index] = top;

    notifyListeners();
  }

  Future<void> reorderOuter(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    int newOrder = outers[newIndex].order;
    if (oldIndex > newIndex) {
      for (int i = newIndex; i < oldIndex; i++) {
        await updateOuterUseCase(
            outers[i].copyWith(order: outers[i + 1].order));
      }
    } else if (oldIndex < newIndex) {
      for (int i = newIndex; i > oldIndex; i--) {
        await updateOuterUseCase(
            outers[i].copyWith(order: outers[i - 1].order));
      }
    } else {
      return;
    }
    await updateOuterUseCase(outers[oldIndex].copyWith(order: newOrder));

    var item = outers.removeAt(oldIndex);
    outers.insert(newIndex, item);

    notifyListeners();
  }

  Future<String> getCategoryTitle(int id) async {
    ClothCategory clothCategory = await getClothCategoryByIdUseCase(id);
    return clothCategory.title;
  }
}
