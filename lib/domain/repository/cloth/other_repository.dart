import '../../model/cloth/other.dart';

abstract class OtherRepository{
  Future<Other> getOtherById(int id);

  Future<List<Other>> getAllOthers();

  Future<void> insertOther(Other other);

  Future<void> deleteOther(Other other);

  Future<void> updateOther(Other other);
}