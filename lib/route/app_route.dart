import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:go_router/go_router.dart';
import 'package:package/auth/auth/auth_repository.dart';
import '../core/domain/entity/export.dart';
import '../core/domain/store/export.dart';
 import '../feature/auth/login/core/login_navigator.dart';
import '../feature/error_screens/go_bharat_rider_error_screen.dart';
import '../feature/home/core/home_navigator.dart';
import '../feature/intro/core/intro_navigator.dart';
import '../feature/on_boarding/core/onboarding_navigator.dart';
  import '../utils/constant/global_variables.dart';
import 'navigator_keys.dart';
import 'route_name.dart';

String initialPage = RouteName.intro.path;

class AppRouter {
  AppRouter();
  static GoRouter get router => _goRouter;

  static final GoRouter _goRouter = GoRouter(
    routerNeglect: true,
    debugLogDiagnostics: true,
    initialLocation: initialPage,
    restorationScopeId: 'router',
    navigatorKey: NavigatorKey.rootKey,
    routes: <RouteBase>[
      IntroNavigator.page(),
      OnboardingNavigator.page(),
      LoginNavigator.page(),
      HomeNavigator.page(),
    ],
    errorBuilder: (ctx, state) => const GoBharatRiderErrorScreen(),
    redirect: (ctx, state) {
      UserEntity user = getIt<UserStore>().state;
      AuthStatus authStatus = getIt<AuthRepository<UserEntity>>().authStatus;
      bool isInLoginPage = state.uri.path != RouteName.login.path;
      bool isInIntroPage = state.uri.path != RouteName.intro.path;
      bool isInOnboardPage = state.uri.path != RouteName.onboarding.path;
      // if (user.isEmpty &&
      //     authStatus == AuthStatus.unAuthenticate &&
      //     isInOnboardPage &&
      //     isInIntroPage &&
      //     isInLoginPage) {
      //   return state.namedLocation(RouteName.login.name);
      // }
      if (state.uri.path == RouteName.onboarding.path) {
        if (!ctx.read<ApplicationStore>().state.isFirstTimeInstall) {
          if (authStatus == AuthStatus.authenticate && user.isEmpty) {
            return state.namedLocation(RouteName.indexHome.name);
          }
          return state.namedLocation(RouteName.login.name);
        }
        return null;
      }

      if (state.uri.path == RouteName.login.path) {
        if (getIt<UserStore>().isEmpty) return null;
        return state.namedLocation(RouteName.indexHome.name);
      }
      return null;
    },
  );
}
