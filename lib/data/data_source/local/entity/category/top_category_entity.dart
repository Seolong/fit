import 'package:hive/hive.dart';

part 'top_category_entity.g.dart';

@HiveType(typeId: 7)
class TopCategoryEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  TopCategoryEntity(this.id, this.title);
}