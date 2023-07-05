import 'package:flutter/material.dart';
import 'package:happy/data/models/common/responses/localeLanguage.dart';
import 'package:happy/domain/use_cases/auth/set_has_opened_onboarding_use_case.dart';

import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';
import '../../../core/locale/bloc/locale_presenter.dart';
import './language_selection_state.dart';

class LanguageSelectionPresenter extends BasePresenter<LanguageSelectionState> {
  LanguageSelectionPresenter(
    this._setHasOpenedOnboardingUseCase, {
    @visibleForTesting LanguageSelectionState? state,
  }) : super(state ?? LanguageSelectionState.initial());

  final _locale = injector.get<LocalePresenter>();
  final SetHasOpenedOnboardingUseCase _setHasOpenedOnboardingUseCase;

  void initLocal() {
    emit(state.copyWith(localeLanguage: localeLanguages));
  }

  void chooseLanguage(LocaleLanguage localeLanguages) {
    emit(state.copyWith(language: localeLanguages));
  }

  Future<void> setLanguage() async {
    await _setHasOpenedOnboarding();
    _locale.setLocale(state.language.locale);
  }

  Future<void> _setHasOpenedOnboarding() async {
    _setHasOpenedOnboardingUseCase.run();
  }
}
