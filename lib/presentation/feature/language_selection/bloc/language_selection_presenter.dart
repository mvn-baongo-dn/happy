import 'package:flutter/material.dart';
import 'package:happy/data/models/common/responses/localeLanguage.dart';
import 'package:happy/domain/use_cases/auth/set_has_opened_onboarding_use_case.dart';
import 'package:happy/domain/use_cases/auth/set_language_use_case.dart';

import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';
import '../../../core/locale/bloc/locale_presenter.dart';
import './language_selection_state.dart';

class LanguageSelectionPresenter extends BasePresenter<LanguageSelectionState> {
  LanguageSelectionPresenter({
   required this.setLanguageUseCase,
   required this.setHasOpenedOnboardingUseCase, 
    @visibleForTesting LanguageSelectionState? state,
  }) : super(state ?? LanguageSelectionState.initial());

  final _locale = injector.get<LocalePresenter>();
  final SetHasOpenedOnboardingUseCase setHasOpenedOnboardingUseCase;
  final SetLanguageUseCase setLanguageUseCase;

  void initLocal() {
    emit(state.copyWith(localeLanguage: localeLanguages));
  }

  void chooseLanguage(LocaleLanguage localeLanguages) {
    emit(state.copyWith(language: localeLanguages));
  }

  Future<void> setLanguage() async {
    await _setHasOpenedOnboarding();
    await _setLanguage(state.language.locale);
     _locale.setLocale();
  }

  Future<void> _setHasOpenedOnboarding() async {
    setHasOpenedOnboardingUseCase.run();
  }

  Future<void> _setLanguage(Locale localeLanguage) async {
    setLanguageUseCase.run(localeLanguage);
  }
}
