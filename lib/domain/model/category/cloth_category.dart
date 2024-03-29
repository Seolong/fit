import 'package:fit/util/type/cloth_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloth_category.freezed.dart';
part 'cloth_category.g.dart';

@freezed
class ClothCategory with _$ClothCategory {
    factory ClothCategory({
      required int id,
      required ClothType type,
      required String title,
      required int order,
    }) = _ClothCategory;

    factory ClothCategory.fromJson(Map<String, dynamic> json) => _$ClothCategoryFromJson(json);
}