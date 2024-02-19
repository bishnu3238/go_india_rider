import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 import 'package:package/package.dart';

import '../../../../../core/domain/store/export.dart';
import '../../../../../utils/constant/app_constant.dart';
import '../../../../../utils/widgets/icons/ver_hor_icon.dart';
import '../core/index_home_bloc.dart';

class IndexAppBar extends StatelessWidget {
  const IndexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<IndexHomeBloc>(context);
    return SliverAppBar(
      title: Text(
        appName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: getFontSize(30),
          fontFamily: familyUrbanist,
          package: 'package',
        ),
      ),
      actions: [
        MoreIcon.vertical(
            onTap: () => showPop(context: context, items: homePopItems(bloc, context))),
      ],
    );
  }
}

List<PopupMenuItem> homePopItems(IndexHomeBloc bloc, BuildContext context) => MapType.values
    .map(
      (e) => PopupMenuItem(
        child: LineRow(
          icon: FontAwesomeIcons.map,
          title: Padding(padding: 12.0.pxSy, child: Text(e.title)),
        ),
        // onTap: () => bloc.add(IndexHomeMapTypeChangeEvent(type: e)),
        onTap: () {
        context.read<GoogleMapStore>().setMapType(e);
        },
      ),
    )
    .toList();

extension MapX on MapType {
  String get title {
    switch (this) {
      case MapType.none:
        return 'Default';
      case MapType.normal:
        return 'Normal Map';
      case MapType.satellite:
        return 'Satellite Map';
      case MapType.terrain:
        return 'Terrain Map';
      case MapType.hybrid:
        return 'Hybrid Map';
    }
  }
}
