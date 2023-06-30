import 'package:happy/presentation/feature/food_tourism/bloc/food_tourism_module.dart';
import 'package:happy/presentation/feature/language_selection/bloc/language_selection_module.dart';

import '../presentation/components/loading_wrapper/bloc/loading_wrapper_module.dart';
import '../presentation/feature/home/bloc/home_page_module.dart';
import '../presentation/feature/login/bloc/login_module.dart';
import '../presentation/feature/splash/bloc/splash_module.dart';

class ModulesInjector {
  static Future<void> register() async {
    // Module loading progress
    LoadingWrapperModule().register();

    // Module splash page
    SplashModule().register();

    // Module login page
    LoginModule().register();

    // Module home page
    HomePageModule().register();

    //FoodTourismModule page
    FoodTourismModule().register();

    //LanguageSelectionModule page
    LanguageSelectionModule().register();
  }
}
