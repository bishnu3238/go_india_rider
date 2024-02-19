import 'package:equatable/equatable.dart';
import 'package:package/package.dart';

class LoginState extends Equatable {
  const LoginState({
    this.phoneNumber = const MobileNumber.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.brand = Brand.custom,
    this.errorMessage,
    this.showPassword = false,
  });

  final MobileNumber phoneNumber;
  final FormzSubmissionStatus status;
  final Brand? brand;
  final String? errorMessage;
  final bool isValid, showPassword;

  LoginState copyWith({
    MobileNumber? phoneNumber,
    FormzSubmissionStatus? status,
    Brand? brand,
    bool? isValid,
    bool? showPassword,
    String? errorMessage,
  }) => LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      brand: brand ?? this.brand,
      showPassword: showPassword ?? this.showPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );

  @override
  List<Object?> get props => [
        phoneNumber,
        status,
      ];

  @override
  String toString() {
    return 'LoginState{phoneNumber: $phoneNumber, status: $status, brand: $brand, errorMessage: $errorMessage, isValid: $isValid, showPassword: $showPassword}';
  }
}
