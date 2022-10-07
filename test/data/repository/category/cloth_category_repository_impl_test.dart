import 'package:fit/data/data_source/local/dao/category/cloth_category_dao.dart';
import 'package:fit/data/data_source/local/entity/category/cloth_category_entity.dart';
import 'package:fit/data/repository/category/cloth_category_repository_impl.dart';
import 'package:fit/di/di_setup.dart';
import 'package:fit/domain/model/category/cloth_category.dart';
import 'package:fit/domain/repository/category/cloth_category_repository.dart';
import 'package:fit/util/type/cloth_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  test('impl test', () async {
    //TestWidgetsFlutterBinding.ensureInitialized();
    //final path = (await getApplicationDocumentsDirectory()).path;
    Hive.init('Test');
    Hive.registerAdapter(ClothCategoryEntityAdapter());
    ClothCategoryDao dao = ClothCategoryDao();
    final ClothCategoryRepository repository = ClothCategoryRepositoryImpl(dao);
    repository.insertClothCategory(ClothCategory(id: 0, type: ClothType.top, title: 'title', order: 0));
    final category = await repository.getClothCategoryById(0);
    expect(category.type, ClothType.top);

    final cate = category.copyWith(type: ClothType.outer);
    repository.updateClothCategory(cate);
    final category2 = await repository.getClothCategoryById(0);
    expect(category2.type, ClothType.outer);

    repository.deleteClothCategory(category);
    final list = await repository.getAllClothCategories();
    //repository.insertClothCategory(ClothCategory(id: 1, type: ClothType.top, title: 'title2'));
    expect(list.length, 0);
    await repository.resetClothCategoryTable();
    final list1 = await repository.getAllClothCategories();
    expect(list1.length, 0);
  });
}