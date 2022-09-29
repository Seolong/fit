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

  OtherEntity(this.id, this.categoryId, this.name, this.details);
}