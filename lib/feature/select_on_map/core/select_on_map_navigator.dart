
import 'package:go_router/go_router.dart';

import '../../../core/domain/store/export.dart';
import '../../../route/route_name.dart';
import '../../../utils/constant/global_variables.dart';
import '../select_on_map.dart';

class SelectOnMapNavigator {
  static GoRoute page() => GoRoute(
      path: RouteName.selectOnMap.subPath,
      name: RouteName.selectOnMap.subCName,
      builder: (ctx, state) {
        var location = getIt<UserLocationStore>();
        return const SelectOnMap();
      });
}
