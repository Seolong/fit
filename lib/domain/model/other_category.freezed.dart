// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'other_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtherCategory _$OtherCategoryFromJson(Map<String, dynamic> json) {
  return _OtherCategory.fromJson(json);
}

/// @nodoc
mixin _$OtherCategory {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherCategoryCopyWith<OtherCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherCategoryCopyWith<$Res> {
  factory $OtherCategoryCopyWith(
          OtherCategory value, $Res Function(OtherCategory) then) =
      _$OtherCategoryCopyWithImpl<$Res>;
  $Res call({int id, String title});
}

/// @nodoc
class _$OtherCategoryCopyWithImpl<$Res>
    implements $OtherCategoryCopyWith<$Res> {
  _$OtherCategoryCopyWithImpl(this._value, this._then);

  final OtherCategory _value;
  // ignore: unused_field
  final $Res Function(OtherCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OtherCategoryCopyWith<$Res>
    implements $OtherCategoryCopyWith<$Res> {
  factory _$$_OtherCategoryCopyWith(
          _$_OtherCategory value, $Res Function(_$_OtherCategory) then) =
      __$$_OtherCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title});
}

/// @nodoc
class __$$_OtherCategoryCopyWithImpl<$Res>
    extends _$OtherCategoryCopyWithImpl<$Res>
    implements _$$_OtherCategoryCopyWith<$Res> {
  __$$_OtherCategoryCopyWithImpl(
      _$_OtherCategory _value, $Res Function(_$_OtherCategory) _then)
      : super(_value, (v) => _then(v as _$_OtherCategory));

  @override
  _$_OtherCategory get _value => super._value as _$_OtherCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_OtherCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtherCategory implements _OtherCategory {
  _$_OtherCategory({required this.id, required this.title});

  factory _$_OtherCategory.fromJson(Map<String, dynamic> json) =>
      _$$_OtherCategoryFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'OtherCategory(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtherCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_OtherCategoryCopyWith<_$_OtherCategory> get copyWith =>
      __$$_OtherCategoryCopyWithImpl<_$_OtherCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtherCategoryToJson(
      this,
    );
  }
}

abstract class _OtherCategory implements OtherCategory {
  factory _OtherCategory({required final int id, required final String title}) =
      _$_OtherCategory;

  factory _OtherCategory.fromJson(Map<String, dynamic> json) =
      _$_OtherCategory.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_OtherCategoryCopyWith<_$_OtherCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
