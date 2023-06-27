import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './exploration_tourism_state.dart';

class ExplorationTourismPresenter
    extends BasePresenter<ExplorationTourismState> {
  ExplorationTourismPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting ExplorationTourismState? state,
  }) : super(state ?? ExplorationTourismState.initial());
}
