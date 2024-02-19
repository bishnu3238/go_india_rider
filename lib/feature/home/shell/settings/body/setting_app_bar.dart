 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/package.dart';
 import '../../../../../core/theme/theme_cubit.dart';
import '../../../../../utils/constant/global_variables.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = getIt<ThemeCubit>().state.isDarkTheme;

    return AppBar(title:   Text('Settings',style:StyleX.urbanist(context)),
      actions: [
        FavIcon(
          onTap: () {},
          icon: isDark ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
