import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';
import '../../../core/domain/entity/export.dart';
import '../../../core/domain/store/export.dart';
import '../../../core/domain/use_cases/update_profile_image_use_case.dart';
import '../../../core/theme/theme_cubit.dart';
import '../../../utils/constant/global_variables.dart';
import '../../place_search/core/place_search_navigator.dart';
import '../../select_on_map/core/select_on_map_navigator.dart';
import '../home.dart';
import '../shell/index_home/core/index_home_bloc.dart';
import '../shell/index_home/index_home.dart';
import '../shell/settings/core/cubit.dart';
import '../shell/settings/settings.dart';
import 'home_initial_params.dart';
import 'home_cubit.dart';
import '../../../route/route_name.dart';

final shellNavigatorIndexKey = GlobalKey<NavigatorState>(debugLabel: 'index');

class HomeNavigator {
  static StatefulShellRoute page() => StatefulShellRoute.indexedStack(
        restorationScopeId: RouteName.home.cName,
        builder: (context, state, navigationShell) {
          return Home(
            key: state.pageKey,
            cubit: getIt<HomeCubit>(
              param1: HomeInitialParams(navigationShell: navigationShell),
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorIndexKey,
            restorationScopeId: RouteName.indexHome.path,
            initialLocation: RouteName.indexHome.path,
            routes: <RouteBase>[
              GoRoute(
                  path: RouteName.indexHome.path,
                  name: RouteName.indexHome.name,
                  builder: (context, state) => IndexHome(key: state.pageKey),
                  routes: [
                    PlaceSearchNavigator.page(),
                    SelectOnMapNavigator.page(),
                  ]),
            ],
          ),
          StatefulShellBranch(
            restorationScopeId: RouteName.settings.path,
            routes: <RouteBase>[
              GoRoute(
                path: RouteName.settings.path,
                name: RouteName.settings.name,
                builder: (context, state) => BlocProvider(
                    create: (ctx) => SettingCubit(
                          authRepository: getIt<AuthRepository<UserEntity>>(),
                          updateProfileImageUseCase: getIt<UpdateProfileImageUseCase>(),
                          notifier: getIt<Notifier>(),
                          themeCubit: getIt<ThemeCubit>(),
                          userStore: getIt<UserStore>(),
                        )..context = context,
                    child: Settings(key: state.pageKey)),
              ),
            ],
          ),
        ],
      );
}
