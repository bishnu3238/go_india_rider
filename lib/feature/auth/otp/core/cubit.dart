import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_rider/route/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../../core/domain/entity/export.dart';
import 'initial_params.dart';
import 'state.dart';

class OtpCubit extends Cubit<OtpState> {
  final Notifier notifier;
  final AuthRepository<UserEntity> authRepository;
  OtpCubit({
    required OtpInitialParams params,
    required this.authRepository,
    required this.notifier,
  }) : super(OtpState(params));

  late BuildContext context;

  void otpChange(String value) {
    final otp = Otp.dirty(value);
    emit(state.copyWith(otp: otp, isValid: Formz.validate([otp])));
  }

  /// TODO: do otp verification logic;
  Future<void> verify(BuildContext context) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    await authRepository.verifyOtp(state.params.vId, state.otp.value).then(
          (value) => value.fold(
            (l) {
              l.log();
              emit(state.copyWith(
                  status: FormzSubmissionStatus.failure,
                  errorMessage: l.message));
              notifier.infoMessage(context: context, message: l.message);
            },
            (user) {
              ' $user'.log;
              emit(state.copyWith(status: FormzSubmissionStatus.success));
              context.goNamed(RouteName.indexHome.name);
            },
          ),
        );
  }
}
