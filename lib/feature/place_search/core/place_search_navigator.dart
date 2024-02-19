

import 'package:go_router/go_router.dart';

import '../../../route/route_name.dart';
import '../place_search.dart';

class PlaceSearchNavigator {
  static GoRoute page() => GoRoute(
        path: RouteName.placeSearch.subPath,
        name: RouteName.placeSearch.subCName,
        builder: (ctx, state) => const PlaceSearch(),
      );
}
