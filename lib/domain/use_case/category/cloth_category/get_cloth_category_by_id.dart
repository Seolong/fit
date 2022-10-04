import 'package:injectable/injectable.dart';

import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';

@injectable
class GetClothCategoryById {
  final ClothCategoryRepository clothCategoryRepository;

  GetClothCategoryById(this.clothCategoryRepository);

  Future<ClothCategory> call(int id) async {
    return await clothCategoryRepository.getClothCategoryById(id);
  }
}