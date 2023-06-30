import 'package:flutter/material.dart';

import './bloc/language_selection_module.dart';
import './bloc/language_selection_presenter.dart';
import './bloc/language_selection_state.dart';
import './components/example_component.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   28/06/2023
/// Page:        [LanguageSelectionPage]
/// Module:      [LanguageSelectionModule]
/// Presenter:   [LanguageSelectionPresenter]
/// State:       [LanguageSelectionState]
/// Description:
/// TODO: This is [LanguageSelectionPage]

class LanguageSelectionPage extends BasePage {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState
    extends BasePageState<LanguageSelectionPage, LanguageSelectionPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        //TODO: (remove) App bar of new page
        title: const Text('LanguageSelectionPage'),
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
///=> Behavior of the [LanguageSelectionPage]
///==========================================================================///
extension _LanguageSelectionPageBehavior on _LanguageSelectionPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
