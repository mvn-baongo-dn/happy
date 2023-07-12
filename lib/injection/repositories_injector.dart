import 'package:happy/data/repositories_impl/storage_repository_impl.dart';
import 'package:happy/domain/repositories/storage_repository.dart';

import './injector.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';

class RepositoriesInjector {
  static Future<void> register() async {
    /// Auth Repository
    injector.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(),
    );

    //Storage Repository
    injector.registerLazySingleton<StorageRepository>(
      () => StorageRepositoryImpl(),
    );
  }
}
