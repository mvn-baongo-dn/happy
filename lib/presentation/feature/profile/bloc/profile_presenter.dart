import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './profile_state.dart';

class ProfilePresenter extends BasePresenter<ProfileState> {
  ProfilePresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting ProfileState? state,
  }) : super(state ?? ProfileState.initial());
}
