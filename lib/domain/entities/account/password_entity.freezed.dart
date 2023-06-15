// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordEntity {
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordEntityCopyWith<PasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordEntityCopyWith<$Res> {
  factory $PasswordEntityCopyWith(
          PasswordEntity value, $Res Function(PasswordEntity) then) =
      _$PasswordEntityCopyWithImpl<$Res, PasswordEntity>;
  @useResult
  $Res call({String? value});
}

/// @nodoc
class _$PasswordEntityCopyWithImpl<$Res, $Val extends PasswordEntity>
    implements $PasswordEntityCopyWith<$Res> {
  _$PasswordEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PasswordEntityCopyWith<$Res>
    implements $PasswordEntityCopyWith<$Res> {
  factory _$$_PasswordEntityCopyWith(
          _$_PasswordEntity value, $Res Function(_$_PasswordEntity) then) =
      __$$_PasswordEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value});
}

/// @nodoc
class __$$_PasswordEntityCopyWithImpl<$Res>
    extends _$PasswordEntityCopyWithImpl<$Res, _$_PasswordEntity>
    implements _$$_PasswordEntityCopyWith<$Res> {
  __$$_PasswordEntityCopyWithImpl(
      _$_PasswordEntity _value, $Res Function(_$_PasswordEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_PasswordEntity(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PasswordEntity extends _PasswordEntity {
  const _$_PasswordEntity(this.value) : super._();

  @override
  final String? value;

  @override
  String toString() {
    return 'PasswordEntity(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordEntity &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordEntityCopyWith<_$_PasswordEntity> get copyWith =>
      __$$_PasswordEntityCopyWithImpl<_$_PasswordEntity>(this, _$identity);
}

abstract class _PasswordEntity extends PasswordEntity {
  const factory _PasswordEntity(final String? value) = _$_PasswordEntity;
  const _PasswordEntity._() : super._();

  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordEntityCopyWith<_$_PasswordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
