import 'package:package/package.dart';

class OtpInitialParams {
  final String vId;
  final int? token;
  final MobileNumber phone;

  const OtpInitialParams({required this.vId, this.token, required this.phone});

  static const OtpInitialParams empty = OtpInitialParams(
    vId: '',
    phone: MobileNumber.pure(),
  );

  @override
  String toString() =>
      'OtpPageInitialParams{vID: $vId, token: $token, phoneNO: $phone}';
}
