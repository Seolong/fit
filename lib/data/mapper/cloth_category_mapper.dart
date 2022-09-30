import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/util/type/cloth_type.dart';

extension ToClothCategory on ClothCategoryEntity {
  ClothCategory toClothCategory() {
    return ClothCategory(
      id: id,
      type: ClothType.values.byName(type),
      title: title,
    );
  }
}

extension ToClothCategoryEntity on ClothCategory {
  ClothCategoryEntity toClothCategoryEntity() {
    return ClothCategoryEntity(
      id: id,
      type: type.name,
      title: title,
    );
  }
}
