import 'package:fit/data/data_source/local/dao/cloth/top_dao.dart';
import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:fit/data/mapper/cloth_mapper.dart';
import 'package:fit/domain/model/cloth/top.dart';
import 'package:fit/domain/repository/cloth/top_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TopRepository)
class TopRepositoryImpl implements TopRepository {
  final TopDao _topDao;

  TopRepositoryImpl(this._topDao);

  @override
  Future<Top> getTopById(int id) async {
    return (await _topDao.getTopEntityById(id))!.toTop();
  }

  @override
  Future<List<Top>> getAllTops() async {
    List<TopEntity> topEntities = await _topDao.getAllTopEntities();
    List<Top> tops = [];
    for(int i=0; i<topEntities.length;i++){
      tops.add(topEntities[i].toTop());
    }
    return tops;
  }

  @override
  Future<void> insertTop(Top top) async {
    await _topDao.insertTopEntity(top.toTopEntity());
  }

  @override
  Future<void> deleteTop(Top top) async {
    await _topDao.deleteTopEntity(top.toTopEntity());
  }

  @override
  Future<void> updateTop(Top top) async {
    await _topDao.updateTopEntity(top.toTopEntity());
  }

  @override
  Future<void> resetTopTable() async{
    await _topDao.resetTopEntityTable();
  }
}