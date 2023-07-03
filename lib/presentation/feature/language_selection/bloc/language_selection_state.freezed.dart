// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LanguageSelectionState {
  List<LocaleLanguage> get localeLanguage => throw _privateConstructorUsedError;
  LocaleLanguage get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguageSelectionStateCopyWith<LanguageSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageSelectionStateCopyWith<$Res> {
  factory $LanguageSelectionStateCopyWith(LanguageSelectionState value,
          $Res Function(LanguageSelectionState) then) =
      _$LanguageSelectionStateCopyWithImpl<$Res, LanguageSelectionState>;
  @useResult
  $Res call({List<LocaleLanguage> localeLanguage, LocaleLanguage language});
}

/// @nodoc
class _$LanguageSelectionStateCopyWithImpl<$Res,
        $Val extends LanguageSelectionState>
    implements $LanguageSelectionStateCopyWith<$Res> {
  _$LanguageSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeLanguage = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      localeLanguage: null == localeLanguage
          ? _value.localeLanguage
          : localeLanguage // ignore: cast_nullable_to_non_nullable
              as List<LocaleLanguage>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as LocaleLanguage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageSelectionStateCopyWith<$Res>
    implements $LanguageSelectionStateCopyWith<$Res> {
  factory _$$_LanguageSelectionStateCopyWith(_$_LanguageSelectionState value,
          $Res Function(_$_LanguageSelectionState) then) =
      __$$_LanguageSelectionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocaleLanguage> localeLanguage, LocaleLanguage language});
}

/// @nodoc
class __$$_LanguageSelectionStateCopyWithImpl<$Res>
    extends _$LanguageSelectionStateCopyWithImpl<$Res,
        _$_LanguageSelectionState>
    implements _$$_LanguageSelectionStateCopyWith<$Res> {
  __$$_LanguageSelectionStateCopyWithImpl(_$_LanguageSelectionState _value,
      $Res Function(_$_LanguageSelectionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localeLanguage = null,
    Object? language = null,
  }) {
    return _then(_$_LanguageSelectionState(
      localeLanguage: null == localeLanguage
          ? _value._localeLanguage
          : localeLanguage // ignore: cast_nullable_to_non_nullable
              as List<LocaleLanguage>,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as LocaleLanguage,
    ));
  }
}

/// @nodoc

class _$_LanguageSelectionState extends _LanguageSelectionState {
  _$_LanguageSelectionState(
      {required final List<LocaleLanguage> localeLanguage,
      required this.language})
      : _localeLanguage = localeLanguage,
        super._();

  final List<LocaleLanguage> _localeLanguage;
  @override
  List<LocaleLanguage> get localeLanguage {
    if (_localeLanguage is EqualUnmodifiableListView) return _localeLanguage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localeLanguage);
  }

  @override
  final LocaleLanguage language;

  @override
  String toString() {
    return 'LanguageSelectionState(localeLanguage: $localeLanguage, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageSelectionState &&
            const DeepCollectionEquality()
                .equals(other._localeLanguage, _localeLanguage) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_localeLanguage), language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageSelectionStateCopyWith<_$_LanguageSelectionState> get copyWith =>
      __$$_LanguageSelectionStateCopyWithImpl<_$_LanguageSelectionState>(
          this, _$identity);
}

abstract class _LanguageSelectionState extends LanguageSelectionState {
  factory _LanguageSelectionState(
      {required final List<LocaleLanguage> localeLanguage,
      required final LocaleLanguage language}) = _$_LanguageSelectionState;
  _LanguageSelectionState._() : super._();

  @override
  List<LocaleLanguage> get localeLanguage;
  @override
  LocaleLanguage get language;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageSelectionStateCopyWith<_$_LanguageSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
