import 'package:injectable/injectable.dart';

import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';

@injectable
class GetAllBottomCategoriesUseCase {
  final ClothCategoryRepository clothCategoryRepository;

  GetAllBottomCategoriesUseCase(this.clothCategoryRepository);

  Future<List<ClothCategory>> call() async {
    return await clothCategoryRepository.getAllBottomCategories();
  }
}