enum DateOfBirthValidationError { invalid, underAge, empty }

class DateOfBirth {
  final DateTime? _value;

  DateOfBirth(this._value);

  const DateOfBirth.dirty([this._value]);

  const DateOfBirth.empty() : _value = null;

  DateTime get date => _value ?? DateTime(1900);

  bool get isValid => _value == null ? false : true;

  @override
  String toString() => 'DateOfBirth{_value: $_value, isValid: $isValid}';

  DateOfBirth copyWith({DateTime? date}) => DateOfBirth(date);

  DateOfBirthValidationError? validate(DateTime? value) {
    if (value == null) return DateOfBirthValidationError.empty;
    if (value == DateTime(1900)) return DateOfBirthValidationError.invalid;
    final selectedDate = DateTime.tryParse(value.toString());
    final age = DateTime.now().difference(selectedDate!).inDays ~/ 365;
    if (age < 18) return DateOfBirthValidationError.underAge;
    return null;
  }
}

extension DateOfBirthErrorX on DateOfBirthValidationError {
  String get text {
    switch (this) {
      case DateOfBirthValidationError.underAge:
        return 'You are no eligible for this, must be 18+';
      case DateOfBirthValidationError.invalid:
        return 'Enter valid date of birth or age';
      case DateOfBirthValidationError.empty:
        return 'please enter dob or age';
    }
  }
}
