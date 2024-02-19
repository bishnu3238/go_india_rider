

import 'package:go_router/go_router.dart';

import '../../../route/route_name.dart';
import '../../../utils/constant/global_variables.dart';
import '../../../utils/functions/dependency_injection.dart';
import '../intro.dart';
import 'intro_cubit.dart';

class IntroNavigator {
  static GoRoute page() => GoRoute(
        path: RouteName.intro.path,
        name: RouteName.intro.cName,
        builder: (ctx, state) => Intro(cubit: getIt<IntroCubit>()),
      );
}
