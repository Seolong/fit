import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/data/mapper/cloth_category_mapper.dart';
import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Cloth Category Mapper Test', () async {
    ClothCategory clothCategory = ClothCategory(
      id: 0,
      type: ClothType.top,
      title: 'title',
    );

    ClothCategoryEntity clothCategoryEntity = ClothCategoryEntity(
      id: 1,
      type: 'bottom',
      title: 'title2',
    );

    expect(clothCategory.toClothCategoryEntity().type, 'top');
    expect(clothCategoryEntity.toClothCategory().type, ClothType.bottom);
  });
}
