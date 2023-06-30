import 'package:flutter/material.dart';
import 'package:happy/data/models/common/responses/localeLanguage.dart';

import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';
import '../../../core/locale/bloc/locale_presenter.dart';
import './language_selection_state.dart';

class LanguageSelectionPresenter extends BasePresenter<LanguageSelectionState> {
  LanguageSelectionPresenter({
    @visibleForTesting LanguageSelectionState? state,
  }) : super(state ?? LanguageSelectionState.initial());

  final _locale = injector.get<LocalePresenter>();

  void initLocal() {
    emit(state.copyWith(localeLanguage: localeLanguages));
  }

  void chooseLanguage(LocaleLanguage localeLanguages) {
    emit(state.copyWith(language: localeLanguages));
  }

  Future<void> setLanguage() async {
    _locale.setLocale(state.language.locale);
  }
}
