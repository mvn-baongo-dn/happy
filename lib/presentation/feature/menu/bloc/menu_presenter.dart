import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './menu_state.dart';

class MenuPresenter extends BasePresenter<MenuState> {
  MenuPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting MenuState? state,
  }) : super(state ?? MenuState.initial());
}
