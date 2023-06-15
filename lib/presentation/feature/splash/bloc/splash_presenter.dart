import 'package:flutter/material.dart';

import './splash_state.dart';
import '../../../../domain/use_cases/auth/get_access_token_local_use_case.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';

class SplashPresenter extends BasePresenter<SplashState> {
  SplashPresenter(
    this._getAccessTokenUseCase, {
    @visibleForTesting SplashState? state,
  }) : super(state ?? SplashState.initial());

  final GetAccessTokenLocalUseCase _getAccessTokenUseCase;

  Future<String?> checkToken() async {
    await Future.delayed(const Duration(seconds: 2));
    return _getAccessTokenUseCase.run();
  }
}
