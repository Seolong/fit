import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:hive/hive.dart';

class ClothCategoryDao {
  final String tableName = 'clothCategory';

  Future<ClothCategoryEntity?> getClothCategoryEntityById(int id) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    return box.get(id);
  }

  Future<List<ClothCategoryEntity>> getAllClothCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    return box.values.toList();
  }

  Future<List<ClothCategoryEntity>> getAllTopCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    return clothCategoryEntities
        .where((e) => e.type == ClothType.top.name)
        .toList();
  }

  Future<List<ClothCategoryEntity>> getAllBottomCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    return clothCategoryEntities
        .where((e) => e.type == ClothType.bottom.name)
        .toList();
  }

  Future<List<ClothCategoryEntity>> getAllOuterCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    return clothCategoryEntities
        .where((e) => e.type == ClothType.outer.name)
        .toList();
  }

  Future<List<ClothCategoryEntity>> getAllOtherCategoryEntities() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    Iterable<ClothCategoryEntity> clothCategoryEntities = box.values;
    return clothCategoryEntities
        .where((e) => e.type == ClothType.other.name)
        .toList();
  }

  Future insertClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    await box.put(clothCategoryEntity.key, clothCategoryEntity);
  }

  Future deleteClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    await clothCategoryEntity.delete();
  }

  Future updateClothCategoryEntity(
      ClothCategoryEntity clothCategoryEntity) async {
    await clothCategoryEntity.save();
  }

  Future resetClothCategoryEntityTable() async {
    final box = await Hive.openBox<ClothCategoryEntity>(tableName);
    await box.clear();
  }
}
