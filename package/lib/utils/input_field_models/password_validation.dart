import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  @override
  PasswordValidationError? validator(String? value) {
    if (value!.isEmpty) {
      return PasswordValidationError.empty;
    } else if (!_passwordRegExp.hasMatch(value)) {
      return PasswordValidationError.invalid;
    }
    return null;
  }
}

extension PasswordX on PasswordValidationError {
  String get text {
    switch (this) {
      case PasswordValidationError.invalid:
        return 'Password must be at least 8 characters and contain at least one letter and number';
      case PasswordValidationError.empty:
        return 'Please enter a password';
    }
  }
}
