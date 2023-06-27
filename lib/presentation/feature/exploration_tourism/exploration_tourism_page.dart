import 'package:flutter/material.dart';

import './bloc/exploration_tourism_module.dart';
import './bloc/exploration_tourism_presenter.dart';
import './bloc/exploration_tourism_state.dart';
import './components/example_component.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   27/06/2023
/// Page:        [ExplorationTourismPage]
/// Module:      [ExplorationTourismModule]
/// Presenter:   [ExplorationTourismPresenter]
/// State:       [ExplorationTourismState]
/// Description:
/// TODO: This is [ExplorationTourismPage]

class ExplorationTourismPage extends BasePage {
  const ExplorationTourismPage({Key? key}) : super(key: key);

  @override
  State<ExplorationTourismPage> createState() => _ExplorationTourismPageState();
}

class _ExplorationTourismPageState
    extends BasePageState<ExplorationTourismPage, ExplorationTourismPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        //TODO: (remove) App bar of new page
        title: const Text('ExplorationTourismPage'),
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
///=> Behavior of the [ExplorationTourismPage]
///==========================================================================///
extension _ExplorationTourismPageBehavior on _ExplorationTourismPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
