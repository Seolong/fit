import 'package:hive/hive.dart';

part 'other_entity.g.dart';

@HiveType(typeId: 3)
class OtherEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int categoryId;

  @HiveField(2)
  String name;

  @HiveField(3)
  String details;

  @HiveField(4)
  int order;

  OtherEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.details,
    required this.order,
  });
}
