import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:hive/hive.dart';

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
        await outerEntity.delete();
    }

    Future updateOuterEntity(OuterEntity outerEntity) async {
        await outerEntity.save();
    }

    Future resetOuterEntityTable() async {
        final box = await Hive.openBox<OuterEntity>(tableName);
        await box.clear();
    }
}