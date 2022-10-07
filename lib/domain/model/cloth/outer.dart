import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outer.freezed.dart';
part 'outer.g.dart';

@freezed
class Outer with _$Outer {
    factory Outer({
      required int id,
      required int categoryId,
      required String name,
      required double totalLength,
      required double shoulderWidth,
      required double chestWidth,
      required double sleeveLength,
      required int order,
    }) = _Outer;

    factory Outer.fromJson(Map<String, dynamic> json) => _$OuterFromJson(json);
}