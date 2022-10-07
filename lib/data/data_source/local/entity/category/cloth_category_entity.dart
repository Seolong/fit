import 'package:hive/hive.dart';

part 'cloth_category_entity.g.dart';

@HiveType(typeId: 8)
class ClothCategoryEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String type;

  @HiveField(2)
  String title;

  @HiveField(3)
  int order;

  ClothCategoryEntity({
    required this.id,
    required this.type,
    required this.title,
    required this.order,
  });
}