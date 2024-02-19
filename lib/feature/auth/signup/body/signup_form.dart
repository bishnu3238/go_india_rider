// import 'package:flutter/material.dart';
// import 'package:package/package.dart';
// import 'package:provider/provider.dart';
//
// import '../core/signup_provider.dart';
//
// class SignupForm extends StatefulWidget {
//   const SignupForm({super.key});
//
//   @override
//   State<SignupForm> createState() => _SignupFormState();
// }
//
// class _SignupFormState extends State<SignupForm> {
//   late TextEditingController fullName;
//   late TextEditingController phoneNo;
//   late TextEditingController email;
//   late TextEditingController password;
//   late TextEditingController referalCode;
//   @override
//   void initState() {
//     super.initState();
//     var provider = context.read<SignupProvider>();
//
//     fullName = TextEditingController(text: provider.formState.name.value)
//       ..addListener(() => provider.nameChanged(fullName.text));
//     email = TextEditingController(text: provider.formState.email.value)
//       ..addListener(() => provider.emailChanged(email.text));
//     phoneNo = TextEditingController(text: provider.formState.phone.value)
//       ..addListener(() => provider.phoneNoChanged(phoneNo.text));
//     referalCode =
//         TextEditingController(text: provider.formState.referralCode.value)
//           ..addListener(() => provider.referalChanged(referalCode.text));
//     password = TextEditingController(text: provider.formState.password.value)
//       ..addListener(() => provider.passwordChanged(password.text));
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     email.dispose();
//     phoneNo.dispose();
//     fullName.dispose();
//     password.dispose();
//     referalCode.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ClearFocus(
//       child: Consumer<SignupProvider>(
//         builder: (context, provider, __) {
//           return Form(
//             key: provider.formState.formKey,
//             child: Column(
//               children: [
//                 TextFieldX(
//                   hint: 'Full Name',
//                   controller: fullName,
//                   validator: provider.nameValidator,
//                 ),
//                 SizedBox(height: height * 0.02),
//                 TextFieldX(
//                   hint: 'Email (optional)',
//                   controller: email,
//                 ),
//                 SizedBox(height: height * 0.02),
//                 PhoneField(
//                   hint: 'Phone Number',
//                   controller: phoneNo,
//                   validator: provider.phoneValidator,
//                 ),
//                 SizedBox(height: height * 0.02),
//                 PasswordField(
//                   controller: password,
//                   showPassword: provider.showPassword,
//                   validator: provider.passWardValidator,
//                   togglePasswordVisibility: provider.togglePasswordVisibility,
//                 ),
//                 SizedBox(height: height * 0.02),
//                 TextFieldX(
//                   hint: 'Referral (Optional)',
//                   controller: referalCode,
//                 ),
//                 SizedBox(height: height * 0.03),
//                 ButtonX(
//                   label: 'Log in',
//                   onTap: provider.signup,
//                   showLoading: provider.formState.status.isInProgress,
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
