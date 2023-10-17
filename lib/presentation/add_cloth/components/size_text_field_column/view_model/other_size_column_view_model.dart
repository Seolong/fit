import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/use_case/cloth/other/insert_other_use_case.dart';
import 'package:fit/domain/use_case/util/count_set/get_new_other_id_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtherSizeColumnViewModel with ChangeNotifier {
  final GetNewOtherIdUseCase getNewOtherIdUseCase;
  final InsertOtherUseCase insertOtherUseCase;

  OtherSizeColumnViewModel(
      this.getNewOtherIdUseCase,
      this.insertOtherUseCase,
      );

  Future<void> addOther({
    required int categoryId,
    required String name,
    required String details,
  }) async {
    int id = await getNewOtherIdUseCase();
    Other other = Other(
      id: id,
      categoryId: categoryId,
      name: name,
      details: details,
      order: id,
    );
    await insertOtherUseCase(other);

    notifyListeners();
  }
}
