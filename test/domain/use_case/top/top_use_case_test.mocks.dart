// Mocks generated by Mockito 5.4.2 from annotations
// in fit/test/domain/use_case/top/top_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:fit/domain/model/cloth/top.dart' as _i2;
import 'package:fit/domain/repository/cloth/top_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTop_0 extends _i1.SmartFake implements _i2.Top {
  _FakeTop_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TopRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRepository extends _i1.Mock implements _i3.TopRepository {
  MockTopRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Top> getTopById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTopById,
          [id],
        ),
        returnValue: _i4.Future<_i2.Top>.value(_FakeTop_0(
          this,
          Invocation.method(
            #getTopById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Top>);

  @override
  _i4.Future<List<_i2.Top>> getAllTops() => (super.noSuchMethod(
        Invocation.method(
          #getAllTops,
          [],
        ),
        returnValue: _i4.Future<List<_i2.Top>>.value(<_i2.Top>[]),
      ) as _i4.Future<List<_i2.Top>>);

  @override
  _i4.Future<void> insertTop(_i2.Top? top) => (super.noSuchMethod(
        Invocation.method(
          #insertTop,
          [top],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> deleteTop(_i2.Top? top) => (super.noSuchMethod(
        Invocation.method(
          #deleteTop,
          [top],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> updateTop(_i2.Top? top) => (super.noSuchMethod(
        Invocation.method(
          #updateTop,
          [top],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> resetTopTable() => (super.noSuchMethod(
        Invocation.method(
          #resetTopTable,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
