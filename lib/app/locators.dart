import 'package:get_it/get_it.dart';
import 'package:paycom/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:paycom/features/auth/data/repository_impl/auth_repo_impl.dart';
import 'package:paycom/features/auth/domain/repositories/authentication_repository.dart';
import 'package:paycom/features/auth/domain/usecases/sign_up_usecase.dart';

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();
  factory SetUpLocators() => _instance;

  static final getIt = GetIt.instance;

  static void init() {
    /// data
    getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(),
    );
    /// usecases
    getIt.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(
        repository: getIt<AuthenticationRepository>(),
      ),
    );
    /// repository
    getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        remoteDatasource: getIt<AuthenticationRemoteDataSource>(),
      ),
    );
  }
}
