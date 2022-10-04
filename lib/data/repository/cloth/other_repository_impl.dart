import 'package:fit/data/mapper/cloth_mapper.dart';
import 'package:fit/domain/model/cloth/other.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/cloth/other_repository.dart';
import '../../data_source/local/dao/cloth/other_dao.dart';
import '../../data_source/local/entity/cloth/other_entity.dart';

@Injectable(as: OtherRepository)
class OtherRepositoryImpl implements OtherRepository {
  final OtherDao _otherDao;

  OtherRepositoryImpl(this._otherDao);

  @override
  Future<Other> getOtherById(int id) async {
    return (await _otherDao.getOtherEntityById(id))!.toOther();
  }

  @override
  Future<List<Other>> getAllOthers() async {
    List<OtherEntity> otherEntities = await _otherDao.getAllOtherEntities();
    List<Other> others = [];
    for (int i = 0; i < otherEntities.length; i++) {
      others.add(otherEntities[i].toOther());
    }
    return others;
  }

  @override
  Future<void> insertOther(Other other) async {
    await _otherDao.insertOtherEntity(other.toOtherEntity());
  }

  @override
  Future<void> deleteOther(Other other) async {
    await _otherDao.deleteOtherEntity(other.toOtherEntity());
  }

  @override
  Future<void> updateOther(Other other) async {
    await _otherDao.updateOtherEntity(other.toOtherEntity());
  }

  @override
  Future<void> resetOtherTable() async {
    await _otherDao.resetOtherEntityTable();
  }
}
