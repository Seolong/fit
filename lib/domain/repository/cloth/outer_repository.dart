import '../../model/cloth/outer.dart';

abstract class OuterRepository{
  Future<Outer> getOuterById(int id);

  Future<List<Outer>> getAllOuters();

  Future<void> insertOuter(Outer outer);

  Future<void> deleteOuter(Outer outer);

  Future<void> updateOuter(Outer outer);
}