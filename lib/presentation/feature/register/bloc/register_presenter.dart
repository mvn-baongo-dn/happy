import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './register_state.dart';

class RegisterPresenter extends BasePresenter<RegisterState> {
  RegisterPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting RegisterState? state,
  }) : super(state ?? RegisterState.initial());
}
