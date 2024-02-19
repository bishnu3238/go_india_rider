import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/entity/export.dart';
import '../../../domain/store/export.dart';
import 'package:package/package.dart';
import '../../model/export.dart';

class RemoteAuthRepository extends AuthRepository<UserEntity> {
  late UserStore userStore;
  final FirebaseAuth firebaseAuth;

  final NetworkService networkService;

  RemoteAuthRepository({
    required this.networkService,
    required this.userStore,
    FirebaseAuth? firebaseAuth,
  }) : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  UserEntity get user => userStore.state;

  @override
  Future<Either<LoginFailure, UserEntity>> login(
      String url, Map<String, String> body) async {
    return await networkService.post(url, body).then((value) => value.fold(
          (l) => left(LoginFailure(l.error)),
          (r) {
            UserEntity user = UserJson.fromMap(r['data']).toDomain();
            userStore.setUser(user);

            return right(user);
          },
        ));
  }

  @override
  AuthStatus get authStatus => user == UserEntity.empty
      ? AuthStatus.unAuthenticate
      : AuthStatus.authenticate;

  @override
  Future<Either<LogoutFailure, bool>> logout() async {
    try {
      firebaseAuth.signOut();
      userStore.setUser(UserEntity.empty);
      return right(true);
    } catch (e) {
      return left(LogoutFailure(e.toString()));
    }
  }

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
  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<FirebaseSendOtpFailure, bool>> sendOtp(
      {required String phoneNumber,
      required CodeSend codeSend,
      required PVFailed pvFailed}) async {
    try {
      return firebaseAuth
          .verifyPhoneNumber(
              phoneNumber: phoneNumber,
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
  // TODO: implement userStream
  Stream<UserEntity> get userStream => throw UnimplementedError();

  @override
  Future<Either<FirebaseOtpVerificationFailure, UserEntity>> verifyOtp(
    String verifyId,
    String smsCode,
  ) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: smsCode,
    );

    try {
      UserCredential user = await firebaseAuth.signInWithCredential(credential);
      if (user.user != null) {
        UserEntity u = user.user!.toUser;
        userStore.setUser(u);

        return right(u);
      }
      return left(const FirebaseOtpVerificationFailure());
    } on FirebaseException catch (e) {
      return left(FirebaseOtpVerificationFailure.fromCode(e.code));
    }
  }

  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {}

  void codeAutoRetrievalTimeout(String verificationId) {}

  @override
  Future<Either<LoginFailure, UserEntity>> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      ).signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var fbUser = await FirebaseAuth.instance.signInWithCredential(credential);
      UserEntity user = UserJson.fromFirebase(fbUser.user).toDomain();
      userStore.setUser(user);

      return right(user);
    } catch (error) {
      return left(LoginFailure(error.toString()));
    }
// Add firebase auth
  }
}

extension UserX on User {
  UserEntity get toUser => UserEntity.empty.copyWith(
        id: uid,
        name: displayName ?? '',
        phoneNo: (phoneNumber) ?? '',
        profileImg: photoURL ?? '',
        gender: Gender.others,
        status: 1,
        date: metadata.creationTime,
      );
}
