import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class OuterDao {
  final String tableName = 'outer';

  Future<OuterEntity?> getOuterEntityById(int id) async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    return box.get(id);
  }

  Future<List<OuterEntity>> getAllOuterEntities() async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    return box.values.toList();
  }

  Future insertOuterEntity(OuterEntity outerEntity) async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    await box.put(outerEntity.id, outerEntity);
  }

  Future deleteOuterEntity(OuterEntity outerEntity) async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    await box.delete(outerEntity.id);
  }

  Future updateOuterEntity(OuterEntity outerEntity) async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    assert(box.get(outerEntity.id) != null,
        'OuterDao: DB has no item whose id is ${outerEntity.id}.');

    await box.put(outerEntity.id, outerEntity);
  }

  Future resetOuterEntityTable() async {
    final box = await Hive.openBox<OuterEntity>(tableName);
    await box.clear();
  }
}
