import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './food_tourism_state.dart';

class FoodTourismPresenter extends BasePresenter<FoodTourismState> {
  FoodTourismPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting FoodTourismState? state,
  }) : super(state ?? FoodTourismState.initial());
}
