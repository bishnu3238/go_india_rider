import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid, empty }

class MobileNumber extends FormzInput<String, PhoneNumberValidationError> {
  const MobileNumber.pure([super.value = '']) : super.pure();
  const MobileNumber.dirty([super. value = '']) : super.dirty( );

  static final _phoneNumberRegExp = RegExp(r'^[0-9]{10}$');

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return PhoneNumberValidationError.empty;
    } else if (!_phoneNumberRegExp.hasMatch(value)) {
      return PhoneNumberValidationError.invalid;
    }
    return null;
  }
}

extension MobileX on MobileNumber {
  String get phoneNoWithCountryCode => "+91 $value";
}

extension MobileErrorX on PhoneNumberValidationError {
  String get text {
    switch (this) {
      case PhoneNumberValidationError.empty:
        return 'please enter phone number';
      case PhoneNumberValidationError.invalid:
        return 'enter valid 10 digit phone no';
    }
  }
}
