import 'package:hive/hive.dart';

part 'other_category_entity.g.dart';

@HiveType(typeId: 5)
class OtherCategoryEntity extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  OtherCategoryEntity(this.id, this.title);
}