import '../../model/category/cloth_category.dart';

abstract class ClothCategoryRepository{
  Future<ClothCategory> getClothCategoryById(int id);

  Future<List<ClothCategory>> getAllClothCategories();

  Future<List<ClothCategory>> getAllTopCategories();

  Future<List<ClothCategory>> getAllBottomCategories();

  Future<List<ClothCategory>> getAllOuterCategories();

  Future<List<ClothCategory>> getAllOtherCategories();

  Future<void> insertClothCategory(ClothCategory clothCategory);

  Future<void> deleteClothCategory(ClothCategory clothCategory);

  Future<void> updateClothCategory(ClothCategory clothCategory);

  Future<void> resetClothCategoryTable();
}