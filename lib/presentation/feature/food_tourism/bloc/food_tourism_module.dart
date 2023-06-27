import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';
import './food_tourism_presenter.dart';

class FoodTourismModule extends BaseModule<FoodTourismPresenter> {
  @override
  void register() {
    //TODO: (remove) Sign up for the site's presenter here. Note that it
    // is necessaryto strictly manage whether this presenter is a factory
    // or a singleton
    injector.registerFactory<FoodTourismPresenter>(
      () => FoodTourismPresenter(),
    );
  }
}
