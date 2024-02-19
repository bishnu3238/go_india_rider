import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:package/package.dart';
import '../../../../core/domain/entity/user/user_entity.dart';
import '../../../../route/route_name.dart';
import '../../otp/core/initial_params.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Notifier notifier;
  final AuthRepository<UserEntity> authRepository;

  LoginCubit({
    required this.authRepository,
    required this.notifier,
  }) : super(const LoginState());

  late BuildContext context;

  void phoneNoChanged(String value) {
    final phone = MobileNumber.dirty(value);
    phone.log;
    emit(state.copyWith(
      phoneNumber: phone,
      isValid: Formz.validate([phone]),
    ));
  }

  Future login(BuildContext context) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    state.phoneNumber.phoneNoWithCountryCode.log;
    await authRepository.sendOtp(
      phoneNumber: state.phoneNumber.phoneNoWithCountryCode,
      codeSend: (String vid, int? token) async {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        context.goNamed(RouteName.otp.subCName,
            extra: OtpInitialParams(
              vId: vid,
              token: token,
              phone: state.phoneNumber,
            ));
      },
      pvFailed: <FirebaseAuthException>(FirebaseAuthException e) {
        'FirebaseAuthException $e'.log();

        var left = FirebaseSendOtpFailure.fromCode(e.toString());

        emit(state.copyWith(
            errorMessage: left.message, status: FormzSubmissionStatus.failure));

        notifier.errorMessage(context: context, message: left.message);
      },
    );
  }

  static void listener(BuildContext context, LoginState state) {
    if (state.status.isFailure) {
      context.read<LoginCubit>().notifier.errorMessage(
            context: context,
            message: state.errorMessage ?? "Authentication Failure",
          );
    }
  }

  String? phoneValidator(PhoneNumber? value) =>
      state.phoneNumber.validator(value!.number)?.text;

  Future socialLogin(Brand brand) async {
    'Social Login Method ${brand.name}'.log;
    emit(state.copyWith(brand: brand));
    state.log;
    switch (brand) {
      case Brand.google:
        await googleSignIn();
        break;

      case Brand.twitter:
        await twitterSignIn();
        break;

      case Brand.facebook:
        await facebookSignIn();
      case Brand.custom:
        return;
    }
    emit(state.copyWith(brand: Brand.custom));
  }

  Future googleSignIn() async {
    await authRepository
        .googleSignIn()
        .then((value) => value.fold(
              (l) => notifier.infoMessage(context: context, message: l.message),
              (r) {
                emit(state.copyWith(
                    brand: Brand.custom,
                    status: FormzSubmissionStatus.success));
                context.goNamed(RouteName.indexHome.name);
              },
            ))
        .whenComplete(() {
      emit(state.copyWith(
        brand: Brand.custom,
        status: FormzSubmissionStatus.success,
      ));
    });
  }

  Future twitterSignIn() async {
      await oneSecondDelay(() {
      emit(state.copyWith(
          brand: Brand.custom, status: FormzSubmissionStatus.success));
      notifier.infoMessage(context: context, message: 'Service Unavailable');
    });
  }

  Future facebookSignIn() async {
    await oneSecondDelay(() {
      emit(state.copyWith(
          brand: Brand.custom, status: FormzSubmissionStatus.success));
      notifier.infoMessage(context: context, message: 'Service Unavailable');
    });
  }

  Future<String?> phoneNoHint() async {
    SmartAuth smartAuth = SmartAuth();
    var appSing = await smartAuth.getAppSignature();
    appSing.log;
    Credential? res = await smartAuth.requestHint(
      isPhoneNumberIdentifierSupported: true,
      showCancelButton: true,
    );
    if (res == null) return null;
    '$res'.log;
    phoneNoChanged(res.id.removeCountryCode);
    return res.name;
  }
}
