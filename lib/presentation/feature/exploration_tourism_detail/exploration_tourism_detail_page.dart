import 'package:flutter/material.dart';

import './bloc/exploration_tourism_detail_module.dart';
import './bloc/exploration_tourism_detail_presenter.dart';
import './bloc/exploration_tourism_detail_state.dart';
import './components/example_component.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   03/07/2023
/// Page:        [ExplorationTourismDetailPage]
/// Module:      [ExplorationTourismDetailModule]
/// Presenter:   [ExplorationTourismDetailPresenter]
/// State:       [ExplorationTourismDetailState]
/// Description:
/// TODO: This is [ExplorationTourismDetailPage]

class ExplorationTourismDetailPage extends BasePage {
  const ExplorationTourismDetailPage({Key? key}) : super(key: key);

  @override
  State<ExplorationTourismDetailPage> createState() =>
      _ExplorationTourismDetailPageState();
}

class _ExplorationTourismDetailPageState extends BasePageState<
    ExplorationTourismDetailPage, ExplorationTourismDetailPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        //TODO: (remove) App bar of new page
        title: const Text('ExplorationTourismDetailPage'),
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
///=> Behavior of the [ExplorationTourismDetailPage]
///==========================================================================///
extension _ExplorationTourismDetailPageBehavior
    on _ExplorationTourismDetailPageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
