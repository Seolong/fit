import 'package:injectable/injectable.dart';

import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';

@injectable
class InsertClothCategoryUseCase {
  final ClothCategoryRepository clothCategoryRepository;

  InsertClothCategoryUseCase(this.clothCategoryRepository);

  Future<void> call(ClothCategory clothCategory) async {
    await clothCategoryRepository.insertClothCategory(clothCategory);
  }
}