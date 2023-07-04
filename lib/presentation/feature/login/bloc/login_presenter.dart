import 'dart:async';

import 'package:flutter/material.dart';

import './login_state.dart';
import '../../../../domain/entities/account/email_entity.dart';
import '../../../../domain/entities/account/login/login_request_entity.dart';
import '../../../../domain/entities/account/login/login_response_entity.dart';
import '../../../../domain/entities/account/password_entity.dart';
import '../../../../domain/use_cases/auth/login_use_case.dart';
import '../../../../domain/use_cases/auth/save_access_token_local_use_case.dart';
import '../../../../utilities/extensions/extensions.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';

class LoginPresenter extends BasePresenter<LoginState> {
  LoginPresenter(
    this._saveAccessTokenUseCase,
    this._loginUseCase, {
    @visibleForTesting LoginState? state,
  }) : super(state ?? LoginState.initial());

  final SaveAccessTokenLocalUseCase _saveAccessTokenUseCase;
  final LoginUseCase _loginUseCase;

  void onEmailChanged(String value) {
    emit(
      state.copyWith(
        email: EmailEntity.create(value),
      ),
    );
    _checkValidButton();
  }

  void onPasswordChanged(String value) {
    emit(
      state.copyWith(
        password: PasswordEntity.create(value),
      ),
    );
    _checkValidButton();
  }

  void _checkValidButton() {
    emit(
      state.copyWith(
        isValidButton: state.email.valid && state.password.valid,
      ),
    );
  }

  Future<LoginResponseEntity?> onPressLogin() async {
    final response = await _loginUseCase.run(
      LoginRequestEntity(
        email: state.email.value ?? '',
        password: state.password.value ?? '',
      ),
    );
    return response.data?.safe((data) {
      unawaited(
        _saveAccessTokenUseCase.run('abcd'),
      );
      return LoginResponseEntity(email: 'bao@gmail.com', accessToken: 'abc', refreshToken: 'abcd');
    });
  }
}
