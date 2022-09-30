import 'package:hive/hive.dart';

part 'outer_category_entity.g.dart';

@HiveType(typeId: 6)
class OuterCategoryEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  OuterCategoryEntity(this.id, this.title);
}