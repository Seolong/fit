import 'package:fit/data/data_source/local/entity/cloth/bottom_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/other_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/outer_entity.dart';
import 'package:fit/data/data_source/local/entity/cloth/top_entity.dart';
import 'package:fit/domain/model/cloth/bottom.dart';
import 'package:fit/domain/model/cloth/other.dart';
import 'package:fit/domain/model/cloth/outer.dart';

import '../../domain/model/cloth/top.dart';

extension ToTop on TopEntity {
  Top toTop() {
    return Top(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
    );
  }
}

extension ToTopEntity on Top {
  TopEntity toTopEntity() {
    return TopEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
    );
  }
}

extension ToBottomEntity on Bottom {
  BottomEntity toBottomEntity() {
    return BottomEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      waist: waist,
      thigh: thigh,
      legOpening: legOpening,
      rise: rise,
    );
  }
}

extension ToBottom on BottomEntity {
  Bottom toBottom() {
    return Bottom(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      waist: waist,
      thigh: thigh,
      legOpening: legOpening,
      rise: rise,
    );
  }
}

extension ToOuterEntity on Outer {
  OuterEntity toOuterEntity() {
    return OuterEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
    );
  }
}

extension ToOuter on OuterEntity {
  Outer toOuter() {
    return Outer(
      id: id,
      categoryId: categoryId,
      name: name,
      totalLength: totalLength,
      shoulderWidth: shoulderWidth,
      chestWidth: chestWidth,
      sleeveLength: sleeveLength,
    );
  }
}

extension ToOtherEntity on Other {
  OtherEntity toOtherEntity() {
    return OtherEntity(
      id: id,
      categoryId: categoryId,
      name: name,
      details: details,
    );
  }
}

extension ToOther on OtherEntity {
  Other toOther() {
    return Other(
      id: id,
      categoryId: categoryId,
      name: name,
      details: details,
    );
  }
}
