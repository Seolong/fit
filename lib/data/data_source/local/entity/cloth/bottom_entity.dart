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

  @HiveField(8)
  int order;

  BottomEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.totalLength,
    required this.waist,
    required this.thigh,
    required this.legOpening,
    required this.rise,
    required this.order,
  });
}
