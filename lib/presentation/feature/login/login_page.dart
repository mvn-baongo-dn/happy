import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import './bloc/login_presenter.dart';
import './components/email_form_field.dart';
import './components/login_button.dart';
import './components/password_form_field.dart';
import '../../../domain/entities/account/login/login_response_entity.dart';
import '../../../utilities/extensions/extensions.dart';
import '../../components/dialog/dialog_platform.dart';
import '../../core/app_lifecycle/app_lifecycle_mixin.dart';
import '../../core/base_page/base_page.dart';
import '../../resources/resources.dart';
import '../../routes/app_router.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginPresenter>
    with AppLifecycleMixin {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        backgroundColor: AppColors.value.background,
        title: Text(
          '',
          style: AppTextStyles.s14w300,
        ),
        centerTitle: true,
      );

  @override
  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              EmailFormField(
                presenter: presenter,
              ),
              const SizedBox(height: 8),
              PasswordFormField(
                presenter: presenter,
              ),
              const SizedBox(height: 16),
              LoginButton(
                presenter: presenter,
                onPressed: _onPressLogin,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );

  @override
  void handlerFutureError(Object? error) {
    // TODO: Override this method to handle errors specific to this page
  }

  @override
  bool get tapOutsideHideKeyBoard => true;

  @override
  bool get resizeToAvoidBottomInset => true;
}

extension _LoginPageBehavior on _LoginPageState {
  void _onPressLogin() {
    presenter
        .onPressLogin()
        .subscribeLoadingFullScreen(this)
        .subscribeHandleError(
          this,
          onError: _handleOnErrorLogin,
        )
        .subscribeOnSuccess(
          this,
          success: _handleOnLoginSuccess,
        );
  }

  void _handleOnLoginSuccess(LoginResponseEntity? value) {
    if (mounted) {
      AutoRouter.of(context).replace(const HomeRoute());
    }
  }

  Future<void> _handleOnErrorLogin(Object? error) async {
    await DialogPlatform(
      content: '',
    ).show(context);
  }
}
