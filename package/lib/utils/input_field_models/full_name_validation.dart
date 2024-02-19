import 'package:formz/formz.dart';

enum FullNameValidationError { invalid, empty }

class Name extends FormzInput<String, FullNameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  static final _nameRegExp = RegExp(r'^[a-zA-Z\s]{2,50}$');

  @override
  FullNameValidationError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : FullNameValidationError.invalid;
  }
}

extension NameErrorX on FullNameValidationError {
  String get text {
    switch (this) {
      case FullNameValidationError.empty:
        return 'please enter your name';
      case FullNameValidationError.invalid:
        return 'enter valid name';
    }
  }
}
