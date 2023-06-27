import 'package:flutter/material.dart';

import './bloc/register_module.dart';
import './bloc/register_presenter.dart';
import './bloc/register_state.dart';
import './components/example_component.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   27/06/2023
/// Page:        [RegisterPage]
/// Module:      [RegisterModule]
/// Presenter:   [RegisterPresenter]
/// State:       [RegisterState]
/// Description:
/// TODO: This is [RegisterPage]

class RegisterPage extends BasePage {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends BasePageState<RegisterPage, RegisterPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        //TODO: (remove) App bar of new page
        title: const Text('RegisterPage'),
        centerTitle: true,
      );

  @override
  Widget buildBody(BuildContext context) => ExampleComponent(
        presenter: presenter,
        //TODO: (remove) presenter will automatically be initialized
        //after initState() is called. No need to initialize this value
      );

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}

///==========================================================================///
///=> Behavior of the [RegisterPage]
///==========================================================================///
extension _RegisterPageBehavior on _RegisterPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
