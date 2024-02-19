import 'package:firebase_auth/firebase_auth.dart';
 import 'package:package/package.dart';
 import '../../../domain/entity/user/user_entity.dart';
import '../../../domain/store/export.dart';

class MockAuthRepository implements AuthRepository<UserEntity> {
  late UserStore userStore;
  final FirebaseAuth firebaseAuth;
  MockAuthRepository({
    required this.userStore,
    FirebaseAuth? firebaseAuth,
  }) : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  AuthStatus get authStatus => user == UserEntity.empty
      ? AuthStatus.unAuthenticate
      : AuthStatus.authenticate;

  @override
  Future<void> checkPhNoExistsOrNot({required String ph, required String url}) {
    // TODO: implement checkPhNoExistsOrNot
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<LoginFailure, UserEntity>> login(
      String url, Map<String, String> body) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<LogoutFailure, bool>> logout() async {
    try {
      return firebaseAuth.signOut().then((value) {
        userStore.setUser(UserEntity.empty);
        return right(true);
      });
    } catch (e) {
      return left(LogoutFailure(e.toString()));
    }
  }

  @override
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        ///TODO: do something;
        if (value.user != null) return;

        /// TODO: if user null then do something
      },
    );
  }

  @override
  Future<Either<FirebaseSendOtpFailure, bool>> sendOtp(
      {required String phoneNumber,
      required CodeSend codeSend,
      required PVFailed pvFailed}) async {
    try {
      return firebaseAuth
          .verifyPhoneNumber(
              verificationCompleted: verificationCompleted,
              verificationFailed: pvFailed,
              codeSent: codeSend,
              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) => right(true));
    } on FirebaseAuthException catch (e) {
      return left(FirebaseSendOtpFailure.fromCode(e.code));
    } on PhoneCodeAutoRetrievalTimeout catch (e) {
      return left(FirebaseSendOtpFailure('$e'));
    }
  }

  @override
  UserEntity get user => userStore.state;

  @override
  // TODO: implement userStream
  Stream<UserEntity> get userStream => throw UnimplementedError();

  @override
  Future<Either<FirebaseOtpVerificationFailure, UserEntity>> verifyOtp(
      String verifyId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: smsCode);

    try {
      UserCredential user = await firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        return right(UserEntity.empty);
      }
      return left(const FirebaseOtpVerificationFailure());
    } on FirebaseAuthException catch (e) {
      return left(FirebaseOtpVerificationFailure.fromCode(e.code));
    }
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {}

  void codeAutoRetrievalTimeout(String verificationId) {}

  @override
  Future<Either<LoginFailure, UserEntity>> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }
}
