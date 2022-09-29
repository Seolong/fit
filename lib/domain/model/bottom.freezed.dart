// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bottom _$BottomFromJson(Map<String, dynamic> json) {
  return _Bottom.fromJson(json);
}

/// @nodoc
mixin _$Bottom {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get totalLength => throw _privateConstructorUsedError;
  double get waist => throw _privateConstructorUsedError;
  double get thigh => throw _privateConstructorUsedError;
  double get legOpening => throw _privateConstructorUsedError;
  double get rise => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottomCopyWith<Bottom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomCopyWith<$Res> {
  factory $BottomCopyWith(Bottom value, $Res Function(Bottom) then) =
      _$BottomCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int categoryId,
      String name,
      double totalLength,
      double waist,
      double thigh,
      double legOpening,
      double rise});
}

/// @nodoc
class _$BottomCopyWithImpl<$Res> implements $BottomCopyWith<$Res> {
  _$BottomCopyWithImpl(this._value, this._then);

  final Bottom _value;
  // ignore: unused_field
  final $Res Function(Bottom) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? totalLength = freezed,
    Object? waist = freezed,
    Object? thigh = freezed,
    Object? legOpening = freezed,
    Object? rise = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalLength: totalLength == freezed
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double,
      waist: waist == freezed
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double,
      thigh: thigh == freezed
          ? _value.thigh
          : thigh // ignore: cast_nullable_to_non_nullable
              as double,
      legOpening: legOpening == freezed
          ? _value.legOpening
          : legOpening // ignore: cast_nullable_to_non_nullable
              as double,
      rise: rise == freezed
          ? _value.rise
          : rise // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_BottomCopyWith<$Res> implements $BottomCopyWith<$Res> {
  factory _$$_BottomCopyWith(_$_Bottom value, $Res Function(_$_Bottom) then) =
      __$$_BottomCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int categoryId,
      String name,
      double totalLength,
      double waist,
      double thigh,
      double legOpening,
      double rise});
}

/// @nodoc
class __$$_BottomCopyWithImpl<$Res> extends _$BottomCopyWithImpl<$Res>
    implements _$$_BottomCopyWith<$Res> {
  __$$_BottomCopyWithImpl(_$_Bottom _value, $Res Function(_$_Bottom) _then)
      : super(_value, (v) => _then(v as _$_Bottom));

  @override
  _$_Bottom get _value => super._value as _$_Bottom;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? totalLength = freezed,
    Object? waist = freezed,
    Object? thigh = freezed,
    Object? legOpening = freezed,
    Object? rise = freezed,
  }) {
    return _then(_$_Bottom(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalLength: totalLength == freezed
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double,
      waist: waist == freezed
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double,
      thigh: thigh == freezed
          ? _value.thigh
          : thigh // ignore: cast_nullable_to_non_nullable
              as double,
      legOpening: legOpening == freezed
          ? _value.legOpening
          : legOpening // ignore: cast_nullable_to_non_nullable
              as double,
      rise: rise == freezed
          ? _value.rise
          : rise // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bottom implements _Bottom {
  _$_Bottom(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.totalLength,
      required this.waist,
      required this.thigh,
      required this.legOpening,
      required this.rise});

  factory _$_Bottom.fromJson(Map<String, dynamic> json) =>
      _$$_BottomFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final String name;
  @override
  final double totalLength;
  @override
  final double waist;
  @override
  final double thigh;
  @override
  final double legOpening;
  @override
  final double rise;

  @override
  String toString() {
    return 'Bottom(id: $id, categoryId: $categoryId, name: $name, totalLength: $totalLength, waist: $waist, thigh: $thigh, legOpening: $legOpening, rise: $rise)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bottom &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.totalLength, totalLength) &&
            const DeepCollectionEquality().equals(other.waist, waist) &&
            const DeepCollectionEquality().equals(other.thigh, thigh) &&
            const DeepCollectionEquality()
                .equals(other.legOpening, legOpening) &&
            const DeepCollectionEquality().equals(other.rise, rise));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(totalLength),
      const DeepCollectionEquality().hash(waist),
      const DeepCollectionEquality().hash(thigh),
      const DeepCollectionEquality().hash(legOpening),
      const DeepCollectionEquality().hash(rise));

  @JsonKey(ignore: true)
  @override
  _$$_BottomCopyWith<_$_Bottom> get copyWith =>
      __$$_BottomCopyWithImpl<_$_Bottom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BottomToJson(
      this,
    );
  }
}

abstract class _Bottom implements Bottom {
  factory _Bottom(
      {required final int id,
      required final int categoryId,
      required final String name,
      required final double totalLength,
      required final double waist,
      required final double thigh,
      required final double legOpening,
      required final double rise}) = _$_Bottom;

  factory _Bottom.fromJson(Map<String, dynamic> json) = _$_Bottom.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  String get name;
  @override
  double get totalLength;
  @override
  double get waist;
  @override
  double get thigh;
  @override
  double get legOpening;
  @override
  double get rise;
  @override
  @JsonKey(ignore: true)
  _$$_BottomCopyWith<_$_Bottom> get copyWith =>
      throw _privateConstructorUsedError;
}
