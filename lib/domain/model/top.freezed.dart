// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Top _$TopFromJson(Map<String, dynamic> json) {
  return _Top.fromJson(json);
}

/// @nodoc
mixin _$Top {
  int get id => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get totalLength => throw _privateConstructorUsedError;
  double get shoulderWidth => throw _privateConstructorUsedError;
  double get chestWidth => throw _privateConstructorUsedError;
  double get sleeveLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopCopyWith<Top> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCopyWith<$Res> {
  factory $TopCopyWith(Top value, $Res Function(Top) then) =
      _$TopCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int categoryId,
      String name,
      double totalLength,
      double shoulderWidth,
      double chestWidth,
      double sleeveLength});
}

/// @nodoc
class _$TopCopyWithImpl<$Res> implements $TopCopyWith<$Res> {
  _$TopCopyWithImpl(this._value, this._then);

  final Top _value;
  // ignore: unused_field
  final $Res Function(Top) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? totalLength = freezed,
    Object? shoulderWidth = freezed,
    Object? chestWidth = freezed,
    Object? sleeveLength = freezed,
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
      shoulderWidth: shoulderWidth == freezed
          ? _value.shoulderWidth
          : shoulderWidth // ignore: cast_nullable_to_non_nullable
              as double,
      chestWidth: chestWidth == freezed
          ? _value.chestWidth
          : chestWidth // ignore: cast_nullable_to_non_nullable
              as double,
      sleeveLength: sleeveLength == freezed
          ? _value.sleeveLength
          : sleeveLength // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_TopCopyWith<$Res> implements $TopCopyWith<$Res> {
  factory _$$_TopCopyWith(_$_Top value, $Res Function(_$_Top) then) =
      __$$_TopCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int categoryId,
      String name,
      double totalLength,
      double shoulderWidth,
      double chestWidth,
      double sleeveLength});
}

/// @nodoc
class __$$_TopCopyWithImpl<$Res> extends _$TopCopyWithImpl<$Res>
    implements _$$_TopCopyWith<$Res> {
  __$$_TopCopyWithImpl(_$_Top _value, $Res Function(_$_Top) _then)
      : super(_value, (v) => _then(v as _$_Top));

  @override
  _$_Top get _value => super._value as _$_Top;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? totalLength = freezed,
    Object? shoulderWidth = freezed,
    Object? chestWidth = freezed,
    Object? sleeveLength = freezed,
  }) {
    return _then(_$_Top(
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
      shoulderWidth: shoulderWidth == freezed
          ? _value.shoulderWidth
          : shoulderWidth // ignore: cast_nullable_to_non_nullable
              as double,
      chestWidth: chestWidth == freezed
          ? _value.chestWidth
          : chestWidth // ignore: cast_nullable_to_non_nullable
              as double,
      sleeveLength: sleeveLength == freezed
          ? _value.sleeveLength
          : sleeveLength // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Top implements _Top {
  _$_Top(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.totalLength,
      required this.shoulderWidth,
      required this.chestWidth,
      required this.sleeveLength});

  factory _$_Top.fromJson(Map<String, dynamic> json) => _$$_TopFromJson(json);

  @override
  final int id;
  @override
  final int categoryId;
  @override
  final String name;
  @override
  final double totalLength;
  @override
  final double shoulderWidth;
  @override
  final double chestWidth;
  @override
  final double sleeveLength;

  @override
  String toString() {
    return 'Top(id: $id, categoryId: $categoryId, name: $name, totalLength: $totalLength, shoulderWidth: $shoulderWidth, chestWidth: $chestWidth, sleeveLength: $sleeveLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Top &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.totalLength, totalLength) &&
            const DeepCollectionEquality()
                .equals(other.shoulderWidth, shoulderWidth) &&
            const DeepCollectionEquality()
                .equals(other.chestWidth, chestWidth) &&
            const DeepCollectionEquality()
                .equals(other.sleeveLength, sleeveLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(totalLength),
      const DeepCollectionEquality().hash(shoulderWidth),
      const DeepCollectionEquality().hash(chestWidth),
      const DeepCollectionEquality().hash(sleeveLength));

  @JsonKey(ignore: true)
  @override
  _$$_TopCopyWith<_$_Top> get copyWith =>
      __$$_TopCopyWithImpl<_$_Top>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopToJson(
      this,
    );
  }
}

abstract class _Top implements Top {
  factory _Top(
      {required final int id,
      required final int categoryId,
      required final String name,
      required final double totalLength,
      required final double shoulderWidth,
      required final double chestWidth,
      required final double sleeveLength}) = _$_Top;

  factory _Top.fromJson(Map<String, dynamic> json) = _$_Top.fromJson;

  @override
  int get id;
  @override
  int get categoryId;
  @override
  String get name;
  @override
  double get totalLength;
  @override
  double get shoulderWidth;
  @override
  double get chestWidth;
  @override
  double get sleeveLength;
  @override
  @JsonKey(ignore: true)
  _$$_TopCopyWith<_$_Top> get copyWith => throw _privateConstructorUsedError;
}
