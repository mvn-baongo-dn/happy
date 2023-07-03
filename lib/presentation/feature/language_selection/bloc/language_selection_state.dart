import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/common/responses/localeLanguage.dart';

part 'language_selection_state.freezed.dart';

@freezed
class LanguageSelectionState with _$LanguageSelectionState {
  factory LanguageSelectionState({
    required List<LocaleLanguage> localeLanguage,
    required LocaleLanguage language,
  }) = _LanguageSelectionState;

  const LanguageSelectionState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory LanguageSelectionState.initial() => LanguageSelectionState(
        localeLanguage: [
          LocaleLanguage(
            id: 1,
            name: 'Việt Nam',
            locale: Locale('vi'),
          )
        ],
        language: LocaleLanguage(
          id: 1,
          name: 'Việt Nam',
          locale: Locale('vi'),
        ),
      );
}
