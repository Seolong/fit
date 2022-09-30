import '../../model/cloth/top.dart';

abstract class TopRepository{
  Future<Top> getTopById(int id);

  Future<List<Top>> getAllTops();

  Future<void> insertTop(Top top);

  Future<void> deleteTop(Top top);

  Future<void> updateTop(Top top);
}