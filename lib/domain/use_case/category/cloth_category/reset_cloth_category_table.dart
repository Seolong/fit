import 'package:injectable/injectable.dart';

import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';

@injectable
class ResetClothCategoryTable {
  final ClothCategoryRepository clothCategoryRepository;

  ResetClothCategoryTable(this.clothCategoryRepository);

  Future<void> call(ClothCategory clothCategory) async {
    await clothCategoryRepository.resetClothCategoryTable();
  }
}