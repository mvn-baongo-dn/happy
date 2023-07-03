import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './exploration_tourism_detail_state.dart';

class ExplorationTourismDetailPresenter
    extends BasePresenter<ExplorationTourismDetailState> {
  ExplorationTourismDetailPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting ExplorationTourismDetailState? state,
  }) : super(state ?? ExplorationTourismDetailState.initial());
}
