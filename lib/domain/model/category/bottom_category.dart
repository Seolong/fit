import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_category.freezed.dart';

part 'bottom_category.g.dart';

@freezed
class BottomCategory with _$BottomCategory {
  factory BottomCategory({
    required int id,
    required String title,
  }) = _BottomCategory;

  factory BottomCategory.fromJson(Map<String, dynamic> json) =>
      _$BottomCategoryFromJson(json);
}
