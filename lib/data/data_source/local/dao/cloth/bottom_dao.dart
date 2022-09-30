import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:hive/hive.dart';

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
        await bottomEntity.delete();
    }

    Future updateBottomEntity(BottomEntity bottomEntity) async {
        await bottomEntity.save();
    }

    Future resetBottomEntityTable() async {
        final box = await Hive.openBox<BottomEntity>(tableName);
        await box.clear();
    }
}