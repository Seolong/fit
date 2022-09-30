import 'package:hive/hive.dart';

part 'bottom_category_entity.g.dart';

@HiveType(typeId: 4)
class BottomCategoryEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  BottomCategoryEntity(this.id, this.title);
}