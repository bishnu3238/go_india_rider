
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
  /// service .................................................................;
  getIt.registerLazySingleton<Notifier>(() => Notifier());
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  /// stores ..................................................................;
  getIt.registerLazySingleton<UserStore>(() => UserStore());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton(() => GoogleMapStore());

  getIt.registerLazySingleton<UserLocationStore>(() => UserLocationStore());
  getIt.registerLazySingleton<ApplicationStore>(() => ApplicationStore(
        locationRepository: getIt<LocationRepository>(),
      ));

  /// Repositories ............................................................;
  getIt.registerLazySingleton<AuthRepository<UserEntity>>(() => RemoteAuthRepository(
        networkService: getIt<NetworkService>(),
        userStore: getIt<UserStore>(),
      ));

  getIt.registerLazySingleton<UserRepository<UserEntity>>(() => RemoteUserRepository(
        userStore: getIt<UserStore>(),
        networkService: getIt<NetworkService>(),
      ));

  getIt.registerLazySingleton<LocationRepository>(
      () => RemoteLocationRepository(getIt<UserLocationStore>()));
  getIt.registerLazySingleton<GoogleMapRepository>(
      () => GoogleMapRepository(getIt<NetworkService>(), getIt<UserLocationStore>()));

  getIt.registerLazySingleton<MapControllerRepository>(
      () => GoogleMapControllerRepository());

  /// user cases ..............................................................;
  getIt.registerSingleton<UpdateProfileImageUseCase>(UpdateProfileImageUseCase(
    getIt<UserRepository<UserEntity>>(),
    getIt<UserStore>(),
    getIt<NetworkService>(),
  ));

  /// form state ..............................................................;

  /// screens .................................................................;

  // getIt.registerLazySingleton<LocationBloc>(() => LocationBloc(
  //       locationRepository: getIt<LocationRepository>(),
  //     )..add(GetDeviceCurrentLocation()));

  getIt.registerLazySingleton<IntroCubit>(
    () => IntroCubit()..init(),
  );

  getIt.registerFactoryParam<HomeCubit, HomeInitialParams, dynamic>(
      (param1, param2) => HomeCubit(
            params: param1,
            getIt<UserStore>(),
            notifier: getIt<Notifier>(),
          ));

  getIt.registerLazySingleton<IndexHomeBloc>(() => IndexHomeBloc(
        userLocationStore: getIt<UserLocationStore>(),
        locationRepository: getIt<LocationRepository>(),
        googleMapRepository: getIt<GoogleMapRepository>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));

  getIt.registerFactoryParam<OtpCubit, OtpInitialParams, dynamic>(
      (param1, param2) => OtpCubit(
            params: param1,
            authRepository: getIt<AuthRepository<UserEntity>>(),
            notifier: getIt<Notifier>(),
          ));

  getIt.registerLazySingleton(() => PlaceSearchCubit(
        getIt<Notifier>(),
        userLocationStore: getIt<UserLocationStore>(),
        locationRepository: getIt<LocationRepository>(),
        googleMapRepository: getIt<GoogleMapRepository>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));

  getIt.registerLazySingleton(() => MapCubit(
        googleMapStore: getIt<GoogleMapStore>(),
        googleMapRepository: getIt<MapRepository>(),
        userLocationStore: getIt<UserLocationStore>(),
        mapControllerRepository: getIt<MapControllerRepository>(),
      ));
}
