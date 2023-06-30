import 'package:flutter/material.dart';

import '../../../core/base_page/base_bloc/base_presenter.dart';
import './language_selection_state.dart';

class LanguageSelectionPresenter extends BasePresenter<LanguageSelectionState> {
  LanguageSelectionPresenter(
      // TODO: (remove) create parameter here.
      {
    @visibleForTesting LanguageSelectionState? state,
  }) : super(state ?? LanguageSelectionState.initial());
}
