import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';
import './language_selection_presenter.dart';

class LanguageSelectionModule extends BaseModule<LanguageSelectionPresenter> {
  @override
  void register() {
    //TODO: (remove) Sign up for the site's presenter here. Note that it
    // is necessaryto strictly manage whether this presenter is a factory
    // or a singleton
    injector.registerFactory<LanguageSelectionPresenter>(
      () => LanguageSelectionPresenter(),
    );
  }
}
