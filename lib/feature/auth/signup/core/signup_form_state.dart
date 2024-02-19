// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:package/package.dart';
//
// @immutable
// class SignupFormState extends Equatable with FormzMixin {
//   SignupFormState({
//     this.isValid = false,
//     required this.formKey,
//     this.name = const Name.pure(),
//     this.email = const Email.pure(),
//     this.password = const Password.pure(),
//     this.phone = const MobileNumber.pure(),
//     this.referralCode = const ReferralCode.pure(),
//     this.status = FormzSubmissionStatus.initial,
//   });
//
//   @override
//   final bool isValid;
//
//   final Name name;
//   final Email email;
//   final Password password;
//   final MobileNumber phone;
//   final ReferralCode referralCode;
//   final FormzSubmissionStatus status;
//   final GlobalKey<FormState> formKey;
//
//   @override
//   List<FormzInput> get inputs => [name, email, phone, password, referralCode];
//
//   @override
//   List<Object?> get props =>
//       [name, email, phone, password, referralCode, status, isValid];
//
//   SignupFormState copyWith({
//     bool? isValid,
//     Name? name,
//     Email? email,
//     Password? password,
//     MobileNumber? phone,
//     ReferralCode? referralCode,
//     FormzSubmissionStatus? status,
//   }) =>
//       SignupFormState(
//         formKey: formKey,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         phone: phone ?? this.phone,
//         status: status ?? this.status,
//         isValid: isValid ?? this.isValid,
//         password: password ?? this.password,
//         referralCode: referralCode ?? this.referralCode,
//       );
// }
