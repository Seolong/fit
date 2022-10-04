import 'package:fit/data/data_source/local/entity/cloth/other_entity.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtherDao {
    final String tableName = 'other.db';

    Future<OtherEntity?> getOtherEntityById(int id) async {
        final box = await Hive.openBox<OtherEntity>(tableName);
        return box.get(id);
    }

    Future<List<OtherEntity>> getAllOtherEntities() async {
        final box = await Hive.openBox<OtherEntity>(tableName);
        return box.values.toList();
    }

    Future insertOtherEntity(OtherEntity otherEntity) async {
        final box = await Hive.openBox<OtherEntity>(tableName);
        await box.put(otherEntity.id, otherEntity);
    }

    Future deleteOtherEntity(OtherEntity otherEntity) async {
        await otherEntity.delete();
    }

    Future updateOtherEntity(OtherEntity otherEntity) async {
        await otherEntity.save();
    }

    Future resetOtherEntityTable() async {
        final box = await Hive.openBox<OtherEntity>(tableName);
        await box.clear();
    }
}