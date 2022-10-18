import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClothCategoryDao {
  final String tableName = 'clothCategory';

  Future<ClothCategoryEntity?> getClothCategoryEntityById(int id) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    return box.get(id);
  }

  Future<List<ClothCategoryEntity>> getAllClothCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    var allItems = box.values.toList();
    allItems.sort((a, b) => a.order.compareTo(b.order));
    return allItems;
  }

  Future<List<ClothCategoryEntity>> getAllTopCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    var topCategories = clothCategoryEntities
        .where((e) => e.type == ClothType.top.name)
        .toList();
    topCategories.sort((a, b) => a.order.compareTo(b.order));
    return topCategories;
  }

  Future<List<ClothCategoryEntity>> getAllBottomCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    var bottomCategories = clothCategoryEntities
        .where((e) => e.type == ClothType.bottom.name)
        .toList();
    bottomCategories.sort((a, b) => a.order.compareTo(b.order));
    return bottomCategories;
  }

  Future<List<ClothCategoryEntity>> getAllOuterCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    var outerCategories = clothCategoryEntities
        .where((e) => e.type == ClothType.outer.name)
        .toList();
    outerCategories.sort((a, b) => a.order.compareTo(b.order));
    return outerCategories;
  }

  Future<List<ClothCategoryEntity>> getAllOtherCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    var otherCategories = clothCategoryEntities
        .where((e) => e.type == ClothType.other.name)
        .toList();
    otherCategories.sort((a, b) => a.order.compareTo(b.order));
    return otherCategories;
  }

  Future insertClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    await box.put(clothCategoryEntity.id, clothCategoryEntity);
  }

  Future deleteClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    await box.delete(clothCategoryEntity.id);
  }

  Future updateClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    assert(box.get(clothCategoryEntity.id) != null,
        'ClothCategoryDao: DB has no item whose id is ${clothCategoryEntity.id}.');

    await box.put(clothCategoryEntity.id, clothCategoryEntity);
  }

  Future resetClothCategoryEntityTable() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    await box.clear();
  }
}
