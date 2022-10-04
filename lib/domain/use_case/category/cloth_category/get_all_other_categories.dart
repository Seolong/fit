import 'package:injectable/injectable.dart';

import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';

@injectable
class GetAllOtherCategories {
  final ClothCategoryRepository clothCategoryRepository;

  GetAllOtherCategories(this.clothCategoryRepository);

  Future<List<ClothCategory>> call() async {
    return await clothCategoryRepository.getAllOtherCategories();
  }
}