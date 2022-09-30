//import 'package:fit/data/data_source/local/dao/category/cloth_category_dao.dart';
import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  test('dao test', () async {
    Hive.init(null);
    Hive.registerAdapter(ClothCategoryEntityAdapter());

    //final dao = ClothCategoryDao();
    // dao.insertClothCategoryEntity(
    //     ClothCategoryEntity(ClothCategoryPrimaryKey(0, 'type'), 'title'));
    // var item = (await dao.getAllClothCategoryEntities()).first;
    // expect(item.key, ClothCategoryPrimaryKey(0, 'type'));
  });
}
