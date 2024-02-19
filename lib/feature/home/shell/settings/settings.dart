import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:go_router/go_router.dart';
import 'package:package/package.dart';
import '../../../../route/route_name.dart';
import 'body/setting_body.dart';
 import 'body/setting_app_bar.dart';
import 'core/cubit.dart';
import 'core/state.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
      listener: (ctx, state) {
        state.user.isEmpty ? context.goNamed(RouteName.login.name) : null;
      },
      builder: (context, state) {
         return OverlayLoader(
          isLoading: state.showLoading,
          child: Scaffold(
            appBar: const SettingAppBar(),
            body: SingleChildScrollView(
              child: Container(padding: 12.px, child: const SettingBody()),
            ),
          ),
        );
      },
    );
  }
}
