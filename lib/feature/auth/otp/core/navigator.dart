
import 'package:go_router/go_router.dart';

import '../../../../route/route_name.dart';
import '../otp.dart';
import 'initial_params.dart';

class OtpNavigator {
  static GoRoute page() => GoRoute(
        path: RouteName.otp.subPath,
        name: RouteName.otp.subCName,
        builder: (ctx, state) => OtpScreen(
          params: state.extra! as OtpInitialParams,
        ),
      );
}
