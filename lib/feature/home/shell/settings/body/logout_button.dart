import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/constant/constant.dart';

import '../core/cubit.dart';
import 'profile_manu_widget.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.cubit});

  final SettingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ProfileMenuWidget(
      titleWidget: Text("Logout", style: StyleX.redInter(context)),
      icon: FontAwesomeIcons.arrowRightFromBracket,
      onPress: cubit.logout,
      endWidget: const SizedBox(),
    );
  }
}
