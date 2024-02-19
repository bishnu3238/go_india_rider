import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/core/domain/store/export.dart';
import 'package:go_india_rider/route/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../../../core/domain/entity/user/user_entity.dart';
import '../../../../../core/domain/use_cases/export.dart';
import '../../../../../core/theme/theme_cubit.dart';
import 'state.dart';

class SettingCubit extends Cubit<SettingState> {
  final AuthRepository<UserEntity> authRepository;
  final ThemeCubit themeCubit;
  final UserStore userStore;
  final Notifier notifier;
  final UpdateProfileImageUseCase updateProfileImageUseCase;

  late BuildContext context;

  bool get themeValue => themeCubit.state.isDarkTheme;
  bool get isAuthenticate =>
      authRepository.authStatus == AuthStatus.authenticate;

  SettingCubit(
      {required this.authRepository,
      required this.updateProfileImageUseCase,
      required this.notifier,
      required this.userStore,
      required this.themeCubit})
      : super(SettingState.init(userStore.state));

  Future<void> pickUpdateImage(BuildContext context) async {
    await showImagePickingOptions(context).then((value) => value.fold(
          (l) {
            'image pick failed $l'.log;
            notifier.infoMessage(context: context, message: l.err);
          },
          (files) async {
            await updateProfileImageUseCase
                .execute(files)
                .then((value) => value.fold(
                      (l) => notifier.errorMessage(
                          context: context, message: l.toString()),
                      (r) => notifier.successMessage(
                          context: context, message: r.toString()),
                    ));
          },
        ));
  }

  Future logout() async {
    emit(state.copyWith(showLoading: true));
    oneSecondDelay(
      () async {
        await authRepository
            .logout()
            .then((value) => value.fold(
                (l) =>
                    notifier.infoMessage(context: context, message: l.message),
                (r) =>
                    notifier.infoMessage(context: context, message: 'Logout')))
            .whenComplete(() => emit(state.copyWith(showLoading: false)));
        if (!context.mounted) return;
        context.goNamed(RouteName.login.name);
      },
    );
  }
}
