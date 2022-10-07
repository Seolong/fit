import 'package:injectable/injectable.dart';

import '../../../domain/repository/util/count_set_repository.dart';
import '../../data_source/local/dao/util/count_set_dao.dart';

@Injectable(as: CountSetRepository)
class CountSetRepositoryImpl implements CountSetRepository {
  final CountSetDao _countSetDao;

  CountSetRepositoryImpl(this._countSetDao);

  @override
  Future<int> getNewBottomId() {
    return _countSetDao.getNewBottomId();
  }

  @override
  Future<int> getNewCategoryId() {
    return _countSetDao.getNewCategoryId();
  }

  @override
  Future<int> getNewOtherId() {
    return _countSetDao.getNewOtherId();
  }

  @override
  Future<int> getNewOuterId() {
    return _countSetDao.getNewOuterId();
  }

  @override
  Future<int> getNewTopId() {
    return _countSetDao.getNewTopId();
  }
}
