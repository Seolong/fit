// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bottom _$$_BottomFromJson(Map<String, dynamic> json) => _$_Bottom(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      name: json['name'] as String,
      totalLength: (json['totalLength'] as num).toDouble(),
      waist: (json['waist'] as num).toDouble(),
      thigh: (json['thigh'] as num).toDouble(),
      legOpening: (json['legOpening'] as num).toDouble(),
      rise: (json['rise'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BottomToJson(_$_Bottom instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'totalLength': instance.totalLength,
      'waist': instance.waist,
      'thigh': instance.thigh,
      'legOpening': instance.legOpening,
      'rise': instance.rise,
    };
