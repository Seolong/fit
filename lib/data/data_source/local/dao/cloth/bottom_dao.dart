import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class BottomDao {
  final String tableName = 'bottom';

  Future<BottomEntity?> getBottomEntityById(int id) async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    return box.get(id);
  }

  Future<List<BottomEntity>> getAllBottomEntities() async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    return box.values.toList();
  }

  Future insertBottomEntity(BottomEntity bottomEntity) async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    await box.put(bottomEntity.id, bottomEntity);
  }

  Future deleteBottomEntity(BottomEntity bottomEntity) async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    await box.delete(bottomEntity.id);
  }

  Future updateBottomEntity(BottomEntity bottomEntity) async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    assert(box.get(bottomEntity.id) != null,
        'BottomDao: DB has no item whose id is ${bottomEntity.id}.');

    await box.put(bottomEntity.id, bottomEntity);
  }

  Future resetBottomEntityTable() async {
    final box = await Hive.openBox<BottomEntity>(tableName);
    await box.clear();
  }
}
