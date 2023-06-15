import './todos_presenter.dart';
import '../../../../domain/use_cases/auth/clear_auth_local_use_case.dart';
import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';

class TodosModule extends BaseModule<TodosPresenter> {
  @override
  void register() {
    injector.registerFactory<TodosPresenter>(
      () => TodosPresenter(
        injector.get<ClearAuthLocalUseCase>(),
      ),
    );
  }
}
