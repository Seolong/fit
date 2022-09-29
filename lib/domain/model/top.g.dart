// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Top _$$_TopFromJson(Map<String, dynamic> json) => _$_Top(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      name: json['name'] as String,
      totalLength: (json['totalLength'] as num).toDouble(),
      shoulderWidth: (json['shoulderWidth'] as num).toDouble(),
      chestWidth: (json['chestWidth'] as num).toDouble(),
      sleeveLength: (json['sleeveLength'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TopToJson(_$_Top instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'totalLength': instance.totalLength,
      'shoulderWidth': instance.shoulderWidth,
      'chestWidth': instance.chestWidth,
      'sleeveLength': instance.sleeveLength,
    };
