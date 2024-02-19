import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:go_router/go_router.dart';
import 'package:package/package.dart';

import '../../../../../route/route_name.dart';
import '../../../../../utils/widgets/icons/svg_image.dart';

class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Positioned(
      top: 10,
      width: MediaQuery.of(context).size.width,
      height: getVerticalSize(50),
      child: CardX(
        elevation: 5,
        padding: edgeInsets5,
        color: color.surface,
        shape: roundBorder30,
        child: Padding(
          padding: edgeInsets8,
          child: Row(
            children: [
              SvgImg(imgSrc: ImgPac.searchIconSvg),
              const SizedBox(width: 10),
              AutoSizeText('Where to?', style: StyleX.urbanistSmall(context)),
              const Spacer(),
              OutlinedButton(
                onPressed: () {},
                child: Icon(
                  FontAwesomeIcons.mapLocation,
                  color: color.onBackground.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        onTap: () => context.goNamed(RouteName.placeSearch.subCName),
      ),
    );
  }
}
