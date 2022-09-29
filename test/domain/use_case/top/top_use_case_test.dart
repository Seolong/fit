import 'package:fit/domain/model/top.dart';
import 'package:fit/domain/repository/top_repository.dart';
import 'package:fit/domain/use_case/top/get_all_tops.dart';
import 'package:fit/domain/use_case/top/get_top_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'top_use_case_test.mocks.dart';

@GenerateMocks([TopRepository])
void main() {
  test('check TopRepository works well', () async {
    final repository = MockTopRepository();
    final getTopById = GetTopById(repository);
    final getAllTops = GetAllTops(repository);

    when(repository.getAllTops()).thenAnswer((_) async => [
          Top(
              id: 0,
              categoryId: 0,
              name: 'name',
              totalLength: 0,
              shoulderWidth: 0,
              chestWidth: 0,
              sleeveLength: 0),
          Top(
              id: 1,
              categoryId: 0,
              name: 'name2',
              totalLength: 1,
              shoulderWidth: 1,
              chestWidth: 1,
              sleeveLength: 1),
        ]);
    List<Top> tops = await getAllTops();
    expect(tops[0].id, 0);
    verify(repository.getAllTops());
  });
}
