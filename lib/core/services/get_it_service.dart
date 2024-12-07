import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:style_craft/Features/Auth/Data/repos/get_profile_repo_impl.dart';
import 'package:style_craft/Features/Auth/Data/repos/login_repo_impl.dart';
import 'package:style_craft/Features/Auth/Data/repos/logout_repo_impl.dart';
import 'package:style_craft/Features/Auth/Data/repos/refresh_token_repo_impl.dart';
import 'package:style_craft/Features/Auth/Data/repos/register_repo_impl.dart';
import 'package:style_craft/Features/Auth/Domain/repos/get_profile_repo.dart';
import 'package:style_craft/Features/Auth/Domain/repos/login_repo.dart';
import 'package:style_craft/Features/Auth/Domain/repos/logout_repo.dart';
import 'package:style_craft/Features/Auth/Domain/repos/refresh_token_repo.dart';
import 'package:style_craft/Features/Auth/Domain/repos/register_repo.dart';
import 'package:style_craft/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/api_interceptors.dart';
import 'package:style_craft/core/Api/dio_consumer.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // EXTERNALS
  getIt.registerLazySingleton(() => Dio());

  // CORE
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<ApiConsumer>(() => getIt<DioConsumer>());

  getIt.registerLazySingleton(() => ApiInterceptors(
        dio: getIt(),
        sharedPreferences: getIt(),
      ));

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  // REPOSITORIES
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(
      apiConsumer: getIt(),
      sharedPreferences: getIt(),
    ),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImpl(
      apiConsumer: getIt(),
      preferences: getIt(),
    ),
  );
  getIt.registerLazySingleton<ProfileInfoRepo>(
    () => ProfileInfoRepoImpl(
      apiConsumer: getIt(),
    ),
  );
  getIt.registerLazySingleton<RefreshTokenRepo>(
    () => RefreshTokenRepoImpl(
      apiConsumer: getIt(),
      sharedPreferences: getIt(),
    ),
  );
  getIt.registerLazySingleton<LogoutRepo>(
    () => LogoutRepoImpl(
      apiConsumer: getIt(),
      dioConsumer: getIt(),
      sharedPreferences: getIt(),
    ),
  );

  // BLOCS
  getIt.registerFactory<AuthCubitCubit>(
    () => AuthCubitCubit(
        loginRepo: getIt(),
        logoutRepo: getIt(),
        profileInfoRepo: getIt(),
        refreshTokenRepo: getIt(),
        registerRepo: getIt(),
        sharedPreferences: getIt()),
  );
}
