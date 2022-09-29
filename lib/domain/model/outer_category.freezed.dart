// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'outer_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OuterCategory _$OuterCategoryFromJson(Map<String, dynamic> json) {
  return _OuterCategory.fromJson(json);
}

/// @nodoc
mixin _$OuterCategory {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OuterCategoryCopyWith<OuterCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OuterCategoryCopyWith<$Res> {
  factory $OuterCategoryCopyWith(
          OuterCategory value, $Res Function(OuterCategory) then) =
      _$OuterCategoryCopyWithImpl<$Res>;
  $Res call({int id, String title});
}

/// @nodoc
class _$OuterCategoryCopyWithImpl<$Res>
    implements $OuterCategoryCopyWith<$Res> {
  _$OuterCategoryCopyWithImpl(this._value, this._then);

  final OuterCategory _value;
  // ignore: unused_field
  final $Res Function(OuterCategory) _then;

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
abstract class _$$_OuterCategoryCopyWith<$Res>
    implements $OuterCategoryCopyWith<$Res> {
  factory _$$_OuterCategoryCopyWith(
          _$_OuterCategory value, $Res Function(_$_OuterCategory) then) =
      __$$_OuterCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title});
}

/// @nodoc
class __$$_OuterCategoryCopyWithImpl<$Res>
    extends _$OuterCategoryCopyWithImpl<$Res>
    implements _$$_OuterCategoryCopyWith<$Res> {
  __$$_OuterCategoryCopyWithImpl(
      _$_OuterCategory _value, $Res Function(_$_OuterCategory) _then)
      : super(_value, (v) => _then(v as _$_OuterCategory));

  @override
  _$_OuterCategory get _value => super._value as _$_OuterCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_OuterCategory(
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
class _$_OuterCategory implements _OuterCategory {
  _$_OuterCategory({required this.id, required this.title});

  factory _$_OuterCategory.fromJson(Map<String, dynamic> json) =>
      _$$_OuterCategoryFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'OuterCategory(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OuterCategory &&
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
  _$$_OuterCategoryCopyWith<_$_OuterCategory> get copyWith =>
      __$$_OuterCategoryCopyWithImpl<_$_OuterCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OuterCategoryToJson(
      this,
    );
  }
}

abstract class _OuterCategory implements OuterCategory {
  factory _OuterCategory({required final int id, required final String title}) =
      _$_OuterCategory;

  factory _OuterCategory.fromJson(Map<String, dynamic> json) =
      _$_OuterCategory.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_OuterCategoryCopyWith<_$_OuterCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
