import '../../otp/core/navigator.dart';
import 'package:go_router/go_router.dart';
import '../../../../route/route_name.dart';
import '../login.dart';

class LoginNavigator {
  static GoRoute page() => GoRoute(
        path: RouteName.login.path,
        name: RouteName.login.name,
        builder: (ctx, state) => const Login(),
        routes: [
          OtpNavigator.page(),
        ],
      );
}
