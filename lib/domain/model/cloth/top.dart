import 'package:freezed_annotation/freezed_annotation.dart';

part 'top.freezed.dart';

part 'top.g.dart';

@freezed
class Top with _$Top {
  factory Top({
    required int id,
    required int categoryId,
    required String name,
    required double totalLength,
    required double shoulderWidth,
    required double chestWidth,
    required double sleeveLength,
    required int order,
  }) = _Top;

  factory Top.fromJson(Map<String, dynamic> json) => _$TopFromJson(json);
}
