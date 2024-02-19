import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

enum AuthStatus { unknown, authenticate, unAuthenticate }

typedef CodeSend = void Function(String, int?);
typedef PVFailed = void Function<E>(E e);

abstract class AuthRepository<T> {
  /// User get currentUser;
  ///
  T get user;

  /// Stream<User> get user;
  ///
  Stream<T> get userStream;

  /// authentication status;
  ///
  AuthStatus get authStatus;

  /// Login with email and password for firebase login;
  ///
  Future<void> logInWithEmailAndPassword(
    String email,
    String password,
  );

  /// check given phone no is already exists or not in server database;
  ///
  Future<void> checkPhNoExistsOrNot({
    required String ph,
    required String url,
  });

  /// send otp to given phone no through [firebase] or [sms] panel;
  ///
  Future<Either<FirebaseSendOtpFailure, bool>> sendOtp({
    required String phoneNumber,
    required CodeSend codeSend,
    required PVFailed pvFailed,
  });

  ///
  ///
  Future<Either<FirebaseOtpVerificationFailure, T>> verifyOtp(
    String verifyId,
    String smsCode,
  );

  ///
  ///
  Future<void> registerWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// login user
  ///
  Future<Either<LoginFailure, T>> login(
    String url,
    Map<String, String> body,
  );
  /// google sign in user
  ///
  Future<Either<LoginFailure, T>> googleSignIn();

  /// logout user
  ///
  Future<Either<LogoutFailure, bool>> logout();

  ///
  ///
  void dispose();
}
