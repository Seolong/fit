import 'package:hive/hive.dart';

part 'outer_entity.g.dart';

@HiveType(typeId: 2)
class OuterEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int categoryId;

  @HiveField(2)
  String name;

  @HiveField(3)
  double totalLength;

  @HiveField(4)
  double shoulderWidth;

  @HiveField(5)
  double chestWidth;

  @HiveField(6)
  double sleeveLength;

  OuterEntity(this.id, this.categoryId, this.name, this.totalLength,
      this.shoulderWidth, this.chestWidth, this.sleeveLength);
}