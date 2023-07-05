import 'package:happy/domain/use_cases/auth/set_has_opened_onboarding_use_case.dart';

import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';
import './language_selection_presenter.dart';

class LanguageSelectionModule extends BaseModule<LanguageSelectionPresenter> {
  @override
  void register() {
    injector.registerFactory<LanguageSelectionPresenter>(
      () => LanguageSelectionPresenter(
        injector.get<SetHasOpenedOnboardingUseCase>(),
      ),
    );
  }
}
