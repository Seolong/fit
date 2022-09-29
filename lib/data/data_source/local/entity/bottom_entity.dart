import 'package:hive/hive.dart';

part 'bottom_entity.g.dart';

@HiveType(typeId: 0)
class BottomEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int categoryId;

  @HiveField(2)
  String name;

  @HiveField(3)
  double totalLength;

  @HiveField(4)
  double waist;

  @HiveField(5)
  double thigh;

  @HiveField(6)
  double legOpening;

  @HiveField(7)
  double rise;

  BottomEntity(this.id, this.categoryId, this.name, this.totalLength,
      this.waist, this.thigh, this.legOpening, this.rise);
}
