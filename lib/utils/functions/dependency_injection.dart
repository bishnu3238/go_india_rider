import 'package:package/package.dart';
import '../../core/data/repository/export.dart';
import '../../core/data/repository/map/google_map_controller_repository.dart';
import '../../core/domain/entity/export.dart';
import '../../core/domain/repository/export.dart';
import '../../core/domain/store/export.dart';
import '../../core/domain/use_cases/export.dart';
import '../../core/theme/theme_cubit.dart';
import '../../feature/auth/otp/core/cubit.dart';
import '../../feature/auth/otp/core/initial_params.dart';
import '../../feature/home/core/home_initial_params.dart';
import '../../feature/home/core/home_cubit.dart';
import '../../feature/home/shell/index_home/core/index_home_bloc.dart';
import '../../feature/intro/core/intro_cubit.dart';
import '../../feature/map_screen/core/map_cubit.dart';
import '../../feature/place_search/core/place_search_cubit.dart';

import '../constant/global_variables.dart';

Future<void> dependencyInjection() async {
  ///
  /// service .................................................................;
  getIt.registerLazySingleton<Notifier>(() => Notifier());
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  ///
  /// stores ..................................................................;
  getIt.registerLazySingleton<UserStore>(() => UserStore());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<GoogleMapStore>(() => GoogleMapStore());

  getIt.registerLazySingleton<UserLocationStore>(() => UserLocationStore());
  getIt.registerLazySingleton<ApplicationStore>(() => ApplicationStore(
        notifier: getIt<Notifier>(),
        locationRepository: getIt<LocationRepository>(),
      ));

  ///
  /// Repositories ............................................................;
  getIt.registerLazySingleton<AuthRepository<UserEntity>>(() => RemoteAuthRepository(
        networkService: getIt<NetworkService>(),
        userStore: getIt<UserStore>(),
      ));

  getIt.registerLazySingleton<UserRepository<UserEntity>>(() => RemoteUserRepository(
        userStore: getIt<UserStore>(),
        networkService: getIt<NetworkService>(),
      ));

  getIt.registerLazySingleton<LocationRepository>(() => RemoteLocationRepository(
        getIt<UserLocationStore>(),
      ));
  getIt.registerLazySingleton<MapRepository>(() => GoogleMapRepository(
        getIt<NetworkService>(),
        getIt<UserLocationStore>(),
      ));

  getIt.registerLazySingleton<MapControllerRepository>(
    () => GoogleMapControllerRepository(),
  );

  ///
  /// user cases ..............................................................;
  getIt.registerSingleton<UpdateProfileImageUseCase>(UpdateProfileImageUseCase(
    getIt<UserRepository<UserEntity>>(),
    getIt<UserStore>(),
    getIt<NetworkService>(),
  ));

  ///
  /// screens .................................................................;

  // [INTRO-CUBIT]
  getIt.registerLazySingleton<IntroCubit>(
    () => IntroCubit()..init(),
  );

  // [HOME-CUBIT]
  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (param1, param2) => HomeCubit(
            params: param1,
            getIt<UserStore>(),
            notifier: getIt<Notifier>(),
          ));

  // [INDEX-HOME-BLOC]
  getIt.registerLazySingleton<IndexHomeBloc>(() => IndexHomeBloc(
        userLocationStore: getIt<UserLocationStore>(),
        locationRepository: getIt<LocationRepository>(),
        mapRepository: getIt<MapRepository>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));

  // [OTP-CUBIT]
  getIt.registerFactoryParam<OtpCubit, OtpInitialParams, dynamic>(
      (param1, param2) => OtpCubit(
            params: param1,
            authRepository: getIt<AuthRepository<UserEntity>>(),
            notifier: getIt<Notifier>(),
          ));

  // [PLACE-SEARCH-CUBIT]
  getIt.registerLazySingleton(() => PlaceSearchCubit(
        getIt<Notifier>(),
        userLocationStore: getIt<UserLocationStore>(),
        locationRepository: getIt<LocationRepository>(),
        mapRepository: getIt<MapRepository>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));

  // [MAP-CUBIT]
  getIt.registerLazySingleton(() => MapCubit(
        googleMapStore: getIt<GoogleMapStore>(),
        googleMapRepository: getIt<MapRepository>(),
        userLocationStore: getIt<UserLocationStore>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));
}
