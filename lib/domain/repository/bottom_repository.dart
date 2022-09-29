import '../model/bottom.dart';

abstract class BottomRepository{
  Future<Bottom> getBottomById(int id);

  Future<List<Bottom>> getAllBottoms();

  Future<void> insertBottom(Bottom bottom);

  Future<void> deleteBottom(Bottom bottom);

  Future<void> updateBottom(Bottom bottom);
}