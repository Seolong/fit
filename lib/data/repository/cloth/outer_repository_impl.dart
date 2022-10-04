import 'package:fit/data/data_source/local/dao/cloth/outer_dao.dart';
import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:fit/domain/model/cloth/outer.dart';
import 'package:fit/domain/repository/cloth/outer_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:fit/data/mapper/cloth_mapper.dart';

@Injectable(as: OuterRepository)
class OuterRepositoryImpl implements OuterRepository {
  final OuterDao _outerDao;

  OuterRepositoryImpl(this._outerDao);

  @override
  Future<Outer> getOuterById(int id) async {
    return (await _outerDao.getOuterEntityById(id))!.toOuter();
  }

  @override
  Future<List<Outer>> getAllOuters() async {
    List<OuterEntity> outerEntities = await _outerDao.getAllOuterEntities();
    List<Outer> outers = [];
    for (int i = 0; i < outerEntities.length; i++) {
      outers.add(outerEntities[i].toOuter());
    }
    return outers;
  }

  @override
  Future<void> insertOuter(Outer outer) async {
    await _outerDao.insertOuterEntity(outer.toOuterEntity());
  }

  @override
  Future<void> deleteOuter(Outer outer) async {
    await _outerDao.deleteOuterEntity(outer.toOuterEntity());
  }

  @override
  Future<void> updateOuter(Outer outer) async {
    await _outerDao.updateOuterEntity(outer.toOuterEntity());
  }

  @override
  Future<void> resetOuterTable() async {
    await _outerDao.resetOuterEntityTable();
  }
}
