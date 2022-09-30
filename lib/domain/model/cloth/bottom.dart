import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom.freezed.dart';
part 'bottom.g.dart';

@freezed
class Bottom with _$Bottom {
    factory Bottom({
      required int id,
      required int categoryId,
      required String name,
      required double totalLength,
      required double waist,
      required double thigh,
      required double legOpening,
      required double rise,
    }) = _Bottom;

    factory Bottom.fromJson(Map<String, dynamic> json) => _$BottomFromJson(json);
}