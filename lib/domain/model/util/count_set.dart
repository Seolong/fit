import 'package:hive/hive.dart';

part 'count_set.g.dart';

@HiveType(typeId: 10)
class CountSet extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int categoryCount;

  @HiveField(1, defaultValue: 0)
  int topCount;

  @HiveField(2, defaultValue: 0)
  int bottomCount;

  @HiveField(3, defaultValue: 0)
  int outerCount;

  @HiveField(4, defaultValue: 0)
  int otherCount;

  CountSet({
    required this.categoryCount,
    required this.topCount,
    required this.bottomCount,
    required this.outerCount,
    required this.otherCount,
  });
}
