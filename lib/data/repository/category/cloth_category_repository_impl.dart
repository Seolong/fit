import 'package:fit/data/mapper/cloth_category_mapper.dart';
import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/category/cloth_category_repository.dart';
import '../../data_source/local/dao/category/cloth_category_dao.dart';
import '../../data_source/local/entity/category/cloth_category_entity.dart';

@Injectable(as: ClothCategoryRepository)
class ClothCategoryRepositoryImpl implements ClothCategoryRepository {
  final ClothCategoryDao _clothCategoryDao;

  ClothCategoryRepositoryImpl(this._clothCategoryDao);

  List<ClothCategory> _getConvertedList(List<ClothCategoryEntity> entityList) {
    List<ClothCategory> clothCategories = [];
    for (int i = 0; i < entityList.length; i++) {
      clothCategories.add(entityList[i].toClothCategory());
    }
    return clothCategories;
  }

  @override
  Future<ClothCategory> getClothCategoryById(int id) async {
    return (await _clothCategoryDao.getClothCategoryEntityById(id))!
        .toClothCategory();
  }

  @override
  Future<List<ClothCategory>> getAllClothCategories() async {
    List<ClothCategoryEntity> clothCategoryEntities =
        await _clothCategoryDao.getAllClothCategoryEntities();
    List<ClothCategory> clothCategories =
        _getConvertedList(clothCategoryEntities);
    return clothCategories;
  }

  @override
  Future<List<ClothCategory>> getAllTopCategories() async {
    List<ClothCategoryEntity> topCategoryEntities =
        await _clothCategoryDao.getAllTopCategoryEntities();
    List<ClothCategory> clothCategories =
        _getConvertedList(topCategoryEntities);
    return clothCategories;
  }

  @override
  Future<List<ClothCategory>> getAllBottomCategories() async {
    List<ClothCategoryEntity> bottomCategoryEntities =
        await _clothCategoryDao.getAllBottomCategoryEntities();
    List<ClothCategory> clothCategories =
        _getConvertedList(bottomCategoryEntities);
    return clothCategories;
  }

  @override
  Future<List<ClothCategory>> getAllOuterCategories() async {
    List<ClothCategoryEntity> outerCategoryEntities =
        await _clothCategoryDao.getAllOuterCategoryEntities();
    List<ClothCategory> clothCategories =
        _getConvertedList(outerCategoryEntities);
    return clothCategories;
  }

  @override
  Future<List<ClothCategory>> getAllOtherCategories() async {
    List<ClothCategoryEntity> otherCategoryEntities =
        await _clothCategoryDao.getAllOtherCategoryEntities();
    List<ClothCategory> clothCategories =
        _getConvertedList(otherCategoryEntities);
    return clothCategories;
  }

  @override
  Future<void> insertClothCategory(ClothCategory clothCategory) async {
    await _clothCategoryDao
        .insertClothCategoryEntity(clothCategory.toClothCategoryEntity());
  }

  @override
  Future<void> deleteClothCategory(ClothCategory clothCategory) async {
    await _clothCategoryDao
        .deleteClothCategoryEntity(clothCategory.toClothCategoryEntity());
  }

  @override
  Future<void> updateClothCategory(ClothCategory clothCategory) async {
    await _clothCategoryDao
        .updateClothCategoryEntity(clothCategory.toClothCategoryEntity());
  }

  @override
  Future<void> resetClothCategoryTable() async {
    await _clothCategoryDao.resetClothCategoryEntityTable();
  }
}
