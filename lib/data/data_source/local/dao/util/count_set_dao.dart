import 'package:fit/domain/model/util/count_set.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@injectable
class CountSetDao {
  final String tableName = 'count_set';
  final int _onlyId = 0;

  Future _initCount() async {
    final box = await Hive.openBox<CountSet>(tableName);
    if (box.get(_onlyId) == null) {
      box.put(
        _onlyId,
        CountSet(
          categoryCount: 0,
          topCount: 0,
          bottomCount: 0,
          outerCount: 0,
          otherCount: 0,
        ),
      );
    }
  }

  /// get (current Count + 1) and set Count += 1
  Future<int> getNewCategoryId() async {
    await _initCount();
    final box = await Hive.openBox<CountSet>(tableName);
    final set = box.get(_onlyId)!;
    box.putAt(
      _onlyId,
      CountSet(
        categoryCount: set.categoryCount + 1,
        topCount: set.topCount,
        bottomCount: set.bottomCount,
        outerCount: set.outerCount,
        otherCount: set.otherCount,
      ),
    );
    return set.categoryCount + 1;
  }

  /// get (current Count + 1) and set Count += 1
  Future<int> getNewTopId() async {
    await _initCount();
    final box = await Hive.openBox<CountSet>(tableName);
    final set = box.get(_onlyId)!;
    box.putAt(
      _onlyId,
      CountSet(
        categoryCount: set.categoryCount,
        topCount: set.topCount + 1,
        bottomCount: set.bottomCount,
        outerCount: set.outerCount,
        otherCount: set.otherCount,
      ),
    );
    return set.topCount + 1;
  }

  /// get (current Count + 1) and set Count += 1
  Future<int> getNewBottomId() async {
    await _initCount();
    final box = await Hive.openBox<CountSet>(tableName);
    final set = box.get(_onlyId)!;
    box.putAt(
      _onlyId,
      CountSet(
        categoryCount: set.categoryCount,
        topCount: set.topCount,
        bottomCount: set.bottomCount + 1,
        outerCount: set.outerCount,
        otherCount: set.otherCount,
      ),
    );
    return set.bottomCount + 1;
  }

  /// get (current Count + 1) and set Count += 1
  Future<int> getNewOuterId() async {
    await _initCount();
    final box = await Hive.openBox<CountSet>(tableName);
    final set = box.get(_onlyId)!;
    box.putAt(
      _onlyId,
      CountSet(
        categoryCount: set.categoryCount,
        topCount: set.topCount,
        bottomCount: set.bottomCount,
        outerCount: set.outerCount + 1,
        otherCount: set.otherCount,
      ),
    );
    return set.outerCount + 1;
  }

  /// get (current Count + 1) and set Count += 1
  Future<int> getNewOtherId() async {
    await _initCount();
    final box = await Hive.openBox<CountSet>(tableName);
    final set = box.get(_onlyId)!;
    box.putAt(
      _onlyId,
      CountSet(
        categoryCount: set.categoryCount,
        topCount: set.topCount,
        bottomCount: set.bottomCount,
        outerCount: set.outerCount,
        otherCount: set.otherCount + 1,
      ),
    );
    return set.otherCount + 1;
  }

  Future resetCountSetTable() async {
    final box = await Hive.openBox<CountSet>(tableName);
    await box.clear();
  }
}
