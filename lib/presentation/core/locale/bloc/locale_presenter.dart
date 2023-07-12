import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy/domain/use_cases/auth/get_app_setting_use_case.dart';

import './locale_state.dart';
import '../support_locale.dart';

class LocalePresenter extends Cubit<LocaleState> {
  LocalePresenter(
    this._getAppSettingUseCase, {
    @visibleForTesting LocaleState? state,
  }) : super(state ?? LocaleState.initial());

  GetAppSettingUseCase _getAppSettingUseCase;
  Locale get locale => state.locale;

  Future<void> initialLocale() async {
    final setting = await _getAppSettingUseCase.run();
    final locale = setting.locale;
    emit(
      state.copyWith(
        locale: Locale(locale ?? SupportLocale.defaultLanguage),
      ),
    );
  }

  Future<void> setLocale() async {
    final setting = await _getAppSettingUseCase.run();
    final locale = setting.locale;
    if (!SupportLocale.support.contains(Locale(locale!))) {
      return;
    }
    emit(
      state.copyWith(locale: Locale(locale)),
    );
  }

  void clearLocale() {
    emit(
      state.copyWith(
        locale: SupportLocale.defaultLocal,
      ),
    );
  }
}
