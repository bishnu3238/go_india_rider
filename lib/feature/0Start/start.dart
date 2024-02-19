import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/theme_cubit.dart';
import '../../core/theme/theme_data.dart';
import '../../core/theme/theme_state.dart';
import '../../route/app_route.dart';
import '../../utils/constant/app_constant.dart';
import '../../utils/constant/global_variables.dart';


class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ThemeCubit, ThemeState>(
      bloc: getIt<ThemeCubit>(),
      builder: (BuildContext context, ThemeState state) {
        return MaterialApp.router(
          title: appName,
          themeMode: state.themeMode,
          theme: state.isDarkTheme ? darkTheme : lightTheme,
          routerConfig: AppRouter.router,
          restorationScopeId: appName,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
