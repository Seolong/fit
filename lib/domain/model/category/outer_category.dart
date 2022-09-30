import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outer_category.freezed.dart';
part 'outer_category.g.dart';

@freezed
class OuterCategory with _$OuterCategory {
    factory OuterCategory({
      required int id,
      required String title,
    }) = _OuterCategory;

    factory OuterCategory.fromJson(Map<String, dynamic> json) => _$OuterCategoryFromJson(json);
}