import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_category.freezed.dart';
part 'other_category.g.dart';

@freezed
class OtherCategory with _$OtherCategory {
    factory OtherCategory({
      required int id,
      required String title,
    }) = _OtherCategory;

    factory OtherCategory.fromJson(Map<String, dynamic> json) => _$OtherCategoryFromJson(json);
}