import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import './bloc/splash_presenter.dart';
import '../../../utilities/extensions/extensions.dart';
import '../../core/base_page/base_page.dart';
import '../../resources/resources.dart';
import '../../routes/app_router.dart';

class SplashPage extends BasePage {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage, SplashPresenter> {
  @override
  void onInitState() {
    super.onInitState();
    _initPage();
  }

  @override
  void onDispose() {
    super.onDispose();
  }

  @override
  Widget buildBody(BuildContext context) => Center(
        child: Text(
          '',
          style: AppTextStyles.s30bold.copyWith(
            color: AppColors.value.blueMain,
          ),
        ),
      );
}

extension _SplashPageBehavior on _SplashPageState {
  void _initPage() {
    presenter
        .checkToken()
        .subscribeHandleError(
          this,
        )
        .subscribeOnSuccess(
          this,
          success: _handleCheckingTokenSuccess,
        );
  }

  void _handleCheckingTokenSuccess(String? value) {
    AutoRouter.of(context).replace(
      value == null ? const LoginRoute() : const HomeRoute(),
    );
  }
}
