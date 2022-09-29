import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_category.freezed.dart';
part 'top_category.g.dart';

@freezed
class TopCategory with _$TopCategory {
    factory TopCategory({
      required int id,
      required String title,
    }) = _TopCategory;

    factory TopCategory.fromJson(Map<String, dynamic> json) => _$TopCategoryFromJson(json);
}