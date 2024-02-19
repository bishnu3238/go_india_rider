// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:biocellar/route/route_name.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:package/package.dart';
//
// class OtpSomeText extends StatelessWidget {
//   const OtpSomeText({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//      return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           "Verification Code",
//           style: StyleX.gideonRoman.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         Padding(
//           padding: edgeInsets5,
//           child: AutoSizeText.rich(
//             TextSpan(
//               text:
//               'Please enter the verification code sent to your mobile number ',
//               children: [
//                 TextSpan(
//                   text: 'cubit.state.params.phoneNO.value.phoneNumberHide',
//                   style: StyleX.gideonRoman ,
//                 )
//               ],
//             ),
//             maxLines: 2,
//             textAlign: TextAlign.center,
//             style: StyleX.gideonRoman.copyWith(fontSize: 14),
//           ),
//         ),
//         const SizedBox(height: 8),
//         FavTextIcon(
//           size: 15,
//           label: 'EDIT',
//           icon: FontAwesomeIcons.penToSquare,
//           iconColor: Theme.of(context).of(context).colorScheme.error,
//           onTap: () => context.go(RouteName.signup.path),
//         ),
//       ],
//     );
//   }
// }
