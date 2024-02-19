import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:go_router/go_router.dart';
import '../../../route/route_name.dart';
import '../onboarding.dart';
import 'onboarding_cubit.dart';

class OnboardingNavigator {
  static GoRoute page() => GoRoute(
        path: RouteName.onboarding.path,
        name: RouteName.onboarding.name,
        builder: (ctx, state) => BlocProvider(
          create: (ctx) => OnboardingCubit(),
          child: const Onboarding(),
        ),
      );
}
