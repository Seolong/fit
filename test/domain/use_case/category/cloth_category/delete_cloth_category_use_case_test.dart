import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/other_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:fit/di/di_setup.dart';
import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/domain/model/util/count_set.dart';
import 'package:fit/domain/use_case/category/cloth_category/delete_cloth_category_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/get_all_cloth_categories_use_case.dart';
import 'package:fit/domain/use_case/category/cloth_category/insert_cloth_category_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/get_all_tops_use_case.dart';
import 'package:fit/domain/use_case/cloth/top/insert_top_use_case.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Hive.init('test');
  Hive.registerAdapter(TopEntityAdapter());
  Hive.registerAdapter(BottomEntityAdapter());
  Hive.registerAdapter(OuterEntityAdapter());
  Hive.registerAdapter(OtherEntityAdapter());
  Hive.registerAdapter(ClothCategoryEntityAdapter());
  Hive.registerAdapter(CountSetAdapter());

  test('check delete all items in a deleted category well', () async {
    final DeleteClothCategoryUseCase deleteClothCategory =
        getIt<DeleteClothCategoryUseCase>();
    final InsertClothCategoryUseCase insertClothCategory =
        getIt<InsertClothCategoryUseCase>();
    final GetAllClothCategoriesUseCase getAllClothCategoriesUseCase =
        getIt<GetAllClothCategoriesUseCase>();
    final InsertTopUseCase insertTopUseCase = getIt<InsertTopUseCase>();
    final GetAllTopsUseCase getAllTopsUseCase = getIt<GetAllTopsUseCase>();

    var clothCategory = ClothCategory(id: 0, type: ClothType.top, title: 'title', order: 0);

    await insertClothCategory(clothCategory);

    var clothCategoryItem = await getAllClothCategoriesUseCase();
    expect(clothCategoryItem.first.id, 0);

    var top = Top(
      id: 0,
      categoryId: 0,
      name: 'name',
      totalLength: 1,
      shoulderWidth: 1,
      chestWidth: 1,
      sleeveLength: 1,
      order: 1,
    );

    await insertTopUseCase(top);

    var tops = await getAllTopsUseCase();

    expect(tops.length, 1);

    await deleteClothCategory(clothCategory);

    clothCategoryItem = await getAllClothCategoriesUseCase();

    tops = await getAllTopsUseCase();

    expect(tops.length, 1);
  });
}
