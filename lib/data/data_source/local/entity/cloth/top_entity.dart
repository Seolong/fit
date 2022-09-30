import 'package:hive/hive.dart';

part 'top_entity.g.dart';

@HiveType(typeId: 1)
class TopEntity extends HiveObject {
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

  TopEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.totalLength,
    required this.shoulderWidth,
    required this.chestWidth,
    required this.sleeveLength,
  });
}
