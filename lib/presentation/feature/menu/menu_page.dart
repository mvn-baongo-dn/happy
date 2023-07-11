import 'package:flutter/material.dart';

import './bloc/menu_module.dart';
import './bloc/menu_presenter.dart';
import './bloc/menu_state.dart';
import './components/example_component.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   10/07/2023
/// Page:        [MenuPage]
/// Module:      [MenuModule]
/// Presenter:   [MenuPresenter]
/// State:       [MenuState]
/// Description:
/// TODO: This is [MenuPage]

class MenuPage extends BasePage {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends BasePageState<MenuPage, MenuPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        //TODO: (remove) App bar of new page
        title: const Text('MenuPage'),
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
///=> Behavior of the [MenuPage]
///==========================================================================///
extension _MenuPageBehavior on _MenuPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
