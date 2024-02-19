// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:package/package.dart';
//
// import '../../../../core/data/api/api_urls.dart';
// import '../../../../core/domain/entity/user/user_entity.dart';
// import 'signup_form_state.dart';
//
// class SignupProvider extends ChangeNotifier {
//   final Notifier notifier;
//   SignupFormState formState;
//   final AuthRepository<UserEntity> authRepository;
//
//   SignupProvider({
//     required this.authRepository,
//     required this.notifier,
//     required this.formState,
//   });
//
//   bool _showPassword = false;
//   bool get showPassword => _showPassword;
//   set showPassword(bool value) {
//     _showPassword = value;
//     notifyListeners();
//   }
//
//   late BuildContext context;
//
//   void nameChanged(String value) {
//     final name = Name.dirty(value);
//     name.log;
//     formState = formState.copyWith(
//       name: name,
//       isValid: Formz.validate([
//         name,
//         formState.email,
//         formState.phone,
//         formState.referralCode,
//         formState.password
//       ]),
//     );
//     notifyListeners();
//   }
//
//   void phoneNoChanged(String value) {
//     final phone = MobileNumber.dirty(value);
//     phone.log;
//     formState = formState.copyWith(
//       phone: phone,
//       isValid: Formz.validate([
//         phone,
//         formState.email,
//         formState.name,
//         formState.referralCode,
//         formState.password
//       ]),
//     );
//     notifyListeners();
//   }
//
//   void emailChanged(String value) {
//     final email = Email.dirty(value);
//     email.log;
//     formState = formState.copyWith(
//       email: email,
//       isValid: Formz.validate([
//         email,
//         formState.phone,
//         formState.name,
//         formState.referralCode,
//         formState.password
//       ]),
//     );
//     notifyListeners();
//   }
//
//   void referalChanged(String value) {
//     final referral = ReferralCode.dirty(value);
//     referral.log;
//     formState = formState.copyWith(
//       referralCode: referral,
//       isValid: Formz.validate([
//         referral,
//         formState.email,
//         formState.name,
//         formState.phone,
//         formState.password
//       ]),
//     );
//     notifyListeners();
//   }
//
//   void passwordChanged(String value) {
//     final password = Password.dirty(value);
//     password.log;
//     formState = formState.copyWith(
//       password: password,
//       isValid: Formz.validate([
//         password,
//         formState.email,
//         formState.name,
//         formState.referralCode,
//         formState.phone
//       ]),
//     );
//     notifyListeners();
//   }
//
//   Future signup() async {
//     if (!formState.formKey.currentState!.validate()) return;
//     if (!formState.isValid) return;
//     Map<String, String> body = {};
//
//     _updateFormState(
//         formState.copyWith(status: FormzSubmissionStatus.inProgress));
//     notifyListeners();
//     await authRepository.login(signUpApi, body).then((value) => value.fold(
//           (l) {
//             _updateFormState(
//                 formState.copyWith(status: FormzSubmissionStatus.failure));
//             notifier.errorMessage(context: context, message: l.message);
//           },
//           (r) {
//             _updateFormState(
//                 formState.copyWith(status: FormzSubmissionStatus.success));
//             'login successfully done'.log;
//             context.pop();
//           },
//         ));
//   }
//
//   togglePasswordVisibility() {
//     _showPassword = !_showPassword;
//     notifyListeners();
//   }
//
//   _updateFormState(SignupFormState state) {
//     formState = state;
//     notifyListeners();
//   }
//
//   String? nameValidator(String? value) =>
//       formState.name.validator(value ?? '')?.text;
//   String? emailValidator(String? value) =>
//       formState.email.validator(value ?? '')?.text;
//   String? phoneValidator(PhoneNumber? value) =>
//       formState.phone.validator(value!.number)?.text;
//   String? passWardValidator(String? value) =>
//       formState.password.validator(value ?? '')?.text;
//   String? referalValidator(String? value) =>
//       formState.referralCode.validator(value ?? '')?.text;
// }
