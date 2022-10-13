import 'package:fit/domain/use_case/category/cloth_category/delete_cloth_category_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_all_bottom_categories_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_all_other_categories_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_all_outer_categories_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_all_top_categories_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/insert_cloth_category_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/update_cloth_category_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_category_id_use_case.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category/cloth_category.dart';

@injectable
class FirstCategoryViewModel with ChangeNotifier {
  final GetNewCategoryIdUseCase getNewCategoryIdUseCase;
  final InsertClothCategoryUseCase insertClothCategoryUseCase;
  final DeleteClothCategory deleteClothCategoryUseCase;
  final UpdateClothCategoryUseCase updateClothCategoryUseCase;
  final GetAllTopCategoriesUseCase getAllTopCategoriesUseCase;
  final GetAllBottomCategoriesUseCase getAllBottomCategoriesUseCase;
  final GetAllOuterCategoriesUseCase getAllOuterCategoriesUseCase;
  final GetAllOtherCategoriesUseCase getAllOtherCategoriesUseCase;

  final List<ClothCategory> categories = [];

  FirstCategoryViewModel(
    this.getNewCategoryIdUseCase,
    this.insertClothCategoryUseCase,
    this.deleteClothCategoryUseCase,
    this.updateClothCategoryUseCase,
    this.getAllTopCategoriesUseCase,
    this.getAllBottomCategoriesUseCase,
    this.getAllOuterCategoriesUseCase,
    this.getAllOtherCategoriesUseCase,
  );

  Future loadClothCategories(ClothType type) async {
    categories.clear();
    switch (type) {
      case ClothType.top:
        categories.addAll(await getAllTopCategoriesUseCase());
        break;
      case ClothType.bottom:
        categories.addAll(await getAllBottomCategoriesUseCase());
        break;
      case ClothType.outer:
        categories.addAll(await getAllOuterCategoriesUseCase());
        break;
      case ClothType.other:
        categories.addAll(await getAllOtherCategoriesUseCase());
        break;
    }
    notifyListeners();
  }

  bool haveThisCategory(ClothType clothType, String title) {
    return categories.any((e) => e.title == title && e.type == clothType);
  }

  /// If this method works successfully, it will return true.
  Future addClothCategory(ClothType clothType, String title) async {
    int id = await getNewCategoryIdUseCase();
    ClothCategory category = ClothCategory(
      id: id,
      type: clothType,
      title: title,
      order: id,
    );
    await insertClothCategoryUseCase(category);
    categories.add(category);

    notifyListeners();
  }

  Future deleteClothCategory(ClothCategory category) async {
    await deleteClothCategoryUseCase(category);
    categories.remove(category);

    notifyListeners();
  }

  Future updateClothCategory(ClothCategory category) async {
    await updateClothCategoryUseCase(category);
    ClothCategory itemInCategories = categories.where((e) => e.id == category.id).first;
    int index = categories.indexOf(itemInCategories);
    print(index);
    assert(index != -1, 'FirstCategoryViewModel: Any item is not updated.');
    categories[index] = category;

    notifyListeners();
  }

  Future reorderClothCategory() async {}
}
