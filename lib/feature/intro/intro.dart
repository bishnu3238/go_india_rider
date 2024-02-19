import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';
import '../../core/constant/image.dart';
import '../../route/route_name.dart';
import 'core/intro_cubit.dart';
import 'core/intro_state.dart';

class Intro extends StatelessWidget {
  final IntroCubit cubit;
  const Intro({super.key, required this.cubit});
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQueryData.fromView(View.of(context));
    return Scaffold(
      body: BlocConsumer<IntroCubit, IntroState>(
        bloc: cubit,
        builder: (context, state) {
          return Center(
            child: ImageShower(
              imgType: ImgType.local,
              imageUrl: ImgCon.appLogo,
              width: getHorizontalSize(100),
            ),
          );
        },
        listener: (BuildContext context, IntroState? state) {
          !state!.isLoading && !state.isWaiting
              ? oneSecondDelay(() => context.go(RouteName.onboarding.path))
              : null;
        },
      ),
    );
  }
}
