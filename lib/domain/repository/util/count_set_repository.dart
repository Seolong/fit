abstract class CountSetRepository{
  Future<int> getNewCategoryId();

  Future<int> getNewTopId();

  Future<int> getNewBottomId();

  Future<int> getNewOuterId();

  Future<int> getNewOtherId();
}