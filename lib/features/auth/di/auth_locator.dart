import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/features/auth/data/auth_repository_impl.dart';
import 'package:spookify_v2/features/auth/data/service/token_service.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';

void initializeAuthLocator(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(instanceName: 'tokenDio', () {
    return Dio(
      BaseOptions(
        baseUrl: 'https://accounts.spotify.com',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
  });

  getIt.registerLazySingleton<TokenService>(
    () => TokenService(getIt<Dio>(instanceName: 'tokenDio')),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<Dio>(instanceName: 'tokenDio'),
      getIt<TokenService>(),
    ),
  );
}
