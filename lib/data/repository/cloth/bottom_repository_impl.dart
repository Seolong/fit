import 'package:fit/data/mapper/cloth_mapper.dart';
import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/cloth/bottom_repository.dart';
import '../../data_source/local/dao/cloth/bottom_dao.dart';
import '../../data_source/local/entity/cloth/bottom_entity.dart';

@Injectable(as: BottomRepository)
class BottomRepositoryImpl implements BottomRepository {
  final BottomDao _bottomDao;

  BottomRepositoryImpl(this._bottomDao);

  @override
  Future<Bottom> getBottomById(int id) async {
    return (await _bottomDao.getBottomEntityById(id))!.toBottom();
  }

  @override
  Future<List<Bottom>> getAllBottoms() async {
    List<BottomEntity> bottomEntities = await _bottomDao.getAllBottomEntities();
    List<Bottom> bottoms = [];
    for (int i = 0; i < bottomEntities.length; i++) {
      bottoms.add(bottomEntities[i].toBottom());
    }
    return bottoms;
  }

  @override
  Future<void> insertBottom(Bottom bottom) async {
    await _bottomDao.insertBottomEntity(bottom.toBottomEntity());
  }

  @override
  Future<void> deleteBottom(Bottom bottom) async {
    await _bottomDao.deleteBottomEntity(bottom.toBottomEntity());
  }

  @override
  Future<void> updateBottom(Bottom bottom) async {
    await _bottomDao.updateBottomEntity(bottom.toBottomEntity());
  }

  @override
  Future<void> resetBottomTable() async {
    await _bottomDao.resetBottomEntityTable();
  }
}
