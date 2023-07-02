import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:happy/presentation/feature/login/components/login_button.dart';
import 'package:rive/rive.dart';

import './bloc/login_presenter.dart';
import './components/email_form_field.dart';
import './components/password_form_field.dart';
import '../../../domain/entities/account/login/login_response_entity.dart';
import '../../../utilities/extensions/extensions.dart';
import '../../core/app_lifecycle/app_lifecycle_mixin.dart';
import '../../core/base_page/base_page.dart';

import '../../routes/app_router.dart';

@RoutePage()
class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginPresenter>
    with AppLifecycleMixin {
  /// input form controller
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  /// rive controller and input
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget buildBody(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFD6E2EA),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Container(
                height: 64,
                width: 64,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage("assets/rive_logo.png"),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Chào mừng bạn trở lại",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 250,
                width: 250,
                child: RiveAnimation.asset(
                  "assets/login-teddy.riv",
                  fit: BoxFit.fitHeight,
                  stateMachines: const ["Login Machine"],
                  onInit: (artBoard) {
                    controller = StateMachineController.fromArtboard(
                      artBoard,

                      /// from rive, you can see it in rive editor
                      "Login Machine",
                    );
                    if (controller == null) return;

                    artBoard.addController(controller!);
                    isChecking = controller?.findInput("isChecking");
                    numLook = controller?.findInput("numLook");
                    isHandsUp = controller?.findInput("isHandsUp");
                    trigSuccess = controller?.findInput("trigSuccess");
                    trigFail = controller?.findInput("trigFail");
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EmailFormField(
                      emailController: emailController,
                      emailFocusNode: emailFocusNode,
                      function: (value) => numLook?.change(
                        value.length.toDouble(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    PasswordFormField(
                      passwordFocusNode: passwordFocusNode,
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 32),
                    LoginButton(presenter: presenter, onPressed: _onPressLogin)
                  ],
                ),
              )
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
  void _onPressLogin() async {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();

    final email = emailController.text;
    final password = passwordController.text;
    presenter.onEmailChanged(email);
    presenter.onPasswordChanged(password);

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

  void _handleOnLoginSuccess(LoginResponseEntity? value) async {
    trigSuccess?.change(true);
    Future.delayed(Duration(seconds: 1));
    if (mounted) {
      AutoRouter.of(context).replace(const HomeRoute());
    }
  }

  Future<void> _handleOnErrorLogin(Object? error) async {
    trigFail?.change(true);
  }
}
