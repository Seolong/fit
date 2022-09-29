// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottom_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BottomCategory _$BottomCategoryFromJson(Map<String, dynamic> json) {
  return _BottomCategory.fromJson(json);
}

/// @nodoc
mixin _$BottomCategory {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottomCategoryCopyWith<BottomCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomCategoryCopyWith<$Res> {
  factory $BottomCategoryCopyWith(
          BottomCategory value, $Res Function(BottomCategory) then) =
      _$BottomCategoryCopyWithImpl<$Res>;
  $Res call({int id, String title});
}

/// @nodoc
class _$BottomCategoryCopyWithImpl<$Res>
    implements $BottomCategoryCopyWith<$Res> {
  _$BottomCategoryCopyWithImpl(this._value, this._then);

  final BottomCategory _value;
  // ignore: unused_field
  final $Res Function(BottomCategory) _then;

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
abstract class _$$_BottomCategoryCopyWith<$Res>
    implements $BottomCategoryCopyWith<$Res> {
  factory _$$_BottomCategoryCopyWith(
          _$_BottomCategory value, $Res Function(_$_BottomCategory) then) =
      __$$_BottomCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title});
}

/// @nodoc
class __$$_BottomCategoryCopyWithImpl<$Res>
    extends _$BottomCategoryCopyWithImpl<$Res>
    implements _$$_BottomCategoryCopyWith<$Res> {
  __$$_BottomCategoryCopyWithImpl(
      _$_BottomCategory _value, $Res Function(_$_BottomCategory) _then)
      : super(_value, (v) => _then(v as _$_BottomCategory));

  @override
  _$_BottomCategory get _value => super._value as _$_BottomCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_BottomCategory(
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
class _$_BottomCategory implements _BottomCategory {
  _$_BottomCategory({required this.id, required this.title});

  factory _$_BottomCategory.fromJson(Map<String, dynamic> json) =>
      _$$_BottomCategoryFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'BottomCategory(id: $id, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BottomCategory &&
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
  _$$_BottomCategoryCopyWith<_$_BottomCategory> get copyWith =>
      __$$_BottomCategoryCopyWithImpl<_$_BottomCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BottomCategoryToJson(
      this,
    );
  }
}

abstract class _BottomCategory implements BottomCategory {
  factory _BottomCategory(
      {required final int id, required final String title}) = _$_BottomCategory;

  factory _BottomCategory.fromJson(Map<String, dynamic> json) =
      _$_BottomCategory.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_BottomCategoryCopyWith<_$_BottomCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
