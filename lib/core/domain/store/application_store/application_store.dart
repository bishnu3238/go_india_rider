import 'package:flutter/material.dart';
import 'package:package/package.dart';

import '../../repository/export.dart';
import 'application_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ApplicationStore extends HydratedCubit<ApplicationState> {
  final Notifier notifier;
  final LocationRepository locationRepository;
  ApplicationStore({
    required this.notifier,
    required this.locationRepository,
  }) : super(const ApplicationState());

  late BuildContext context;

  /// wait three second and then
  /// check if [state.isFirstTimeInstall] == true
  /// then go to [onboarding] Screen and request for user [permissions];
  /// if [state.isFirstTimeInstall] == false
  /// then check [ifUserIsLoggedIn] == true => [IndexHome] : [Login]
  ///
  /// TODO: update the isPermissionGranted;
  Future<void> init() async {
    'ApplicationStore => init()'.log;

    if (!state.isFirstTimeInstall) {
      if (state.isPermissionGranted) return;
      await locationRepository.getCurrentLocation();
    }
    await locationRepository.requestPermission().then((value) => value.fold(
          (l) => notifier.infoMessage(context: context, message: l.error),
          (r) => emit(state.copyWith(
              isPermissionGranted: r, isLoading: false, isFirstTimeInstall: false,)),
        )).whenComplete(() async=>
    await thrSecondDelay(() {
      emit(state.copyWith(isFirstTimeInstall: false, isLoading: false));
    }));
  }

  @override
  ApplicationState? fromJson(Map<String, dynamic> json) {
    'json $json'.log;
    return ApplicationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ApplicationState state) {
    'state $state'.log;
    return state.toMap();
  }
}
