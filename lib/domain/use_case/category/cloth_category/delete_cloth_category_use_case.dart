import 'package:injectable/injectable.dart';

import '../../../../util/type/cloth_type.dart';
import '../../../model/category/cloth_category.dart';
import '../../../repository/category/cloth_category_repository.dart';
import '../../../repository/cloth/bottom_repository.dart';
import '../../../repository/cloth/other_repository.dart';
import '../../../repository/cloth/outer_repository.dart';
import '../../../repository/cloth/top_repository.dart';

@injectable
class DeleteClothCategoryUseCase {
  final ClothCategoryRepository clothCategoryRepository;
  final TopRepository topRepository;
  final BottomRepository bottomRepository;
  final OuterRepository outerRepository;
  final OtherRepository otherRepository;

  DeleteClothCategoryUseCase(
    this.clothCategoryRepository,
    this.topRepository,
    this.bottomRepository,
    this.outerRepository,
    this.otherRepository,
  );

  Future<void> call(ClothCategory clothCategory) async {
    await clothCategoryRepository.deleteClothCategory(clothCategory);

    switch (clothCategory.type) {
      case ClothType.top:
        final allTops = await topRepository.getAllTops();
        final topsInDeletedCategory =
            allTops.where((e) => e.categoryId == clothCategory.id).toList();
        for (var top in topsInDeletedCategory) {
          topRepository.deleteTop(top);
        }
        break;
      case ClothType.bottom:
        final allBottoms = await bottomRepository.getAllBottoms();
        final bottomsInDeletedCategory =
            allBottoms.where((e) => e.categoryId == clothCategory.id).toList();
        for (var bottom in bottomsInDeletedCategory) {
          bottomRepository.deleteBottom(bottom);
        }
        break;
      case ClothType.outer:
        final allOuters = await outerRepository.getAllOuters();
        final outersInDeletedCategory =
            allOuters.where((e) => e.categoryId == clothCategory.id).toList();
        for (var outer in outersInDeletedCategory) {
          outerRepository.deleteOuter(outer);
        }
        break;
      case ClothType.other:
        final allOthers = await otherRepository.getAllOthers();
        final otherInDeletedCategory =
            allOthers.where((e) => e.categoryId == clothCategory.id).toList();
        for (var other in otherInDeletedCategory) {
          otherRepository.deleteOther(other);
        }
        break;
    }
  }
}
