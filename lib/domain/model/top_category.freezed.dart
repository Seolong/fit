// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'top_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopCategory _$TopCategoryFromJson(Map<String, dynamic> json) {
  return _TopCategory.fromJson(json);
}

/// @nodoc
mixin _$TopCategory {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopCategoryCopyWith<TopCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCategoryCopyWith<$Res> {
  factory $TopCategoryCopyWith(
          TopCategory value, $Res Function(TopCategory) then) =
      _$TopCategoryCopyWithImpl<$Res>;
  $Res call({int id, String title});
}

/// @nodoc
class _$TopCategoryCopyWithImpl<$Res> implements $TopCategoryCopyWith<$Res> {
  _$TopCategoryCopyWithImpl(this._value, this._then);

  final TopCategory _value;
  // ignore: unused_field
  final $Res Function(TopCategory) _then;

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
abstract class _$$_TopCategoryCopyWith<$Res>
    implements $TopCategoryCopyWith<$Res> {
  factory _$$_TopCategoryCopyWith(
          _$_TopCategory value, $Res Function(_$_TopCategory) then) =
      __$$_TopCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title});
}

/// @nodoc
class __$$_TopCategoryCopyWithImpl<$Res> extends _$TopCategoryCopyWithImpl<$Res>
    implements _$$_TopCategoryCopyWith<$Res> {
  __$$_TopCategoryCopyWithImpl(
      _$_TopCategory _value, $Res Function(_$_TopCategory) _then)
      : super(_value, (v) => _then(v as _$_TopCategory));

  @override
  _$_TopCategory get _value => super._value as _$_TopCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_TopCategory(
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
class _$_TopCategory implements _TopCategory {
  _$_TopCategory({required this.id, required this.title});

  factory _$_TopCategory.fromJson(Map<String, dynamic> json) =>
      _$$_TopCategoryFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'TopCategory(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopCategory &&
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
  _$$_TopCategoryCopyWith<_$_TopCategory> get copyWith =>
      __$$_TopCategoryCopyWithImpl<_$_TopCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopCategoryToJson(
      this,
    );
  }
}

abstract class _TopCategory implements TopCategory {
  factory _TopCategory({required final int id, required final String title}) =
      _$_TopCategory;

  factory _TopCategory.fromJson(Map<String, dynamic> json) =
      _$_TopCategory.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_TopCategoryCopyWith<_$_TopCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
