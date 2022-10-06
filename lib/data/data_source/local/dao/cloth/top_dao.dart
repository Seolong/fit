import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class TopDao {
  final String tableName = 'top';

  Future<TopEntity?> getTopEntityById(int id) async {
    final box = await Hive.openBox<TopEntity>(tableName);
    return box.get(id);
  }

  Future<List<TopEntity>> getAllTopEntities() async {
    final box = await Hive.openBox<TopEntity>(tableName);
    return box.values.toList();
  }

  Future insertTopEntity(TopEntity topEntity) async {
    final box = await Hive.openBox<TopEntity>(tableName);
    await box.put(topEntity.id, topEntity);
  }

  Future deleteTopEntity(TopEntity topEntity) async {
    final box = await Hive.openBox<TopEntity>(tableName);
    await box.delete(topEntity.id);
  }

  Future updateTopEntity(TopEntity topEntity) async {
    final box = await Hive.openBox<TopEntity>(tableName);
    assert(box.get(topEntity.id) != null,
    'TopDao: DB has no item whose id is ${topEntity.id}.');

    await box.put(topEntity.id, topEntity);
  }

  Future resetTopEntityTable() async {
    final box = await Hive.openBox<TopEntity>(tableName);
    await box.clear();
  }
}
