import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './food_tourism_detail_state.dart';

class FoodTourismDetailPresenter extends BasePresenter<FoodTourismDetailState> {
  FoodTourismDetailPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting FoodTourismDetailState? state,
  }) : super(state ?? FoodTourismDetailState.initial());
}
