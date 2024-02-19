
import 'package:go_router/go_router.dart';

import '../../../../route/route_name.dart';
import '../../create_new_password/create_new_password.dart';
import '../forget_password.dart';

class ForgetPasswordNavigator {
  static GoRoute page() => GoRoute(
      path: RouteName.forgetPassword.subPath,
      name: RouteName.forgetPassword.subCName,
      builder: (ctx, state) => const ForgetPasswordPage(),routes: [
    GoRoute(
      path: RouteName.newPassword.subPath,
      name: RouteName.newPassword.subCName,
      builder: (ctx, state) => const NewPasswordPage(),
    ),
  ],);
}
