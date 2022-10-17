import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_cloth_category_by_id_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/delete_top_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/get_all_tops_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/insert_top_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/update_top_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_top_id_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class TopListViewModel with ChangeNotifier {
  final GetNewTopIdUseCase getNewTopIdUseCase;
  final InsertTopUseCase insertTopUseCase;
  final DeleteTopUseCase deleteTopUseCase;
  final UpdateTopUseCase updateTopUseCase;
  final GetAllTopsUseCase getAllTopsUseCase;
  final GetClothCategoryByIdUseCase getClothCategoryByIdUseCase;

  List<Top> tops = [];

  TopListViewModel(
    this.getNewTopIdUseCase,
    this.insertTopUseCase,
    this.deleteTopUseCase,
    this.updateTopUseCase,
    this.getAllTopsUseCase,
    this.getClothCategoryByIdUseCase,
  );

  Future<void> loadTops(int categoryId) async {
    var allTops = await getAllTopsUseCase();
    tops = allTops.where((e) => e.categoryId == categoryId).toList();

    notifyListeners();
  }

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
    tops.add(top);

    notifyListeners();
  }

  Future<void> deleteTop(Top top) async {
    await deleteTopUseCase(top);
    tops.remove(top);

    notifyListeners();
  }

  Future<void> updateTop(Top top) async {
    await updateTopUseCase(top);
    Top itemInTops = tops.where((e) => e.id == top.id).first;
    int index = tops.indexOf(itemInTops);
    assert(index != -1, 'TopListViewModel: Any item is not updated.');
    tops[index] = top;

    notifyListeners();
  }

  Future<void> reorderTop() async {}

  Future<String> getCategoryTitle(int id) async {
    ClothCategory clothCategory = await getClothCategoryByIdUseCase(id);
    return clothCategory.title;
  }
}
