import 'package:freezed_annotation/freezed_annotation.dart';

part 'other.freezed.dart';
part 'other.g.dart';

@freezed
class Other with _$Other {
    factory Other({
      required int id,
      required int categoryId,
      required String name,
      required String details,
      required int order,
    }) = _Other;

    factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}