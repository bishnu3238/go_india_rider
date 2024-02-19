import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/package.dart';
import '../../../../../core/theme/theme_cubit.dart';
import '../../../../../core/theme/theme_state.dart';
import '../../../../../utils/constant/global_variables.dart';
import '../../../../../utils/functions/dependency_injection.dart';
import 'profile_manu_widget.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ProfileMenuWidget(
            title: "Contact Us",
            icon: FontAwesomeIcons.buffer,
            onPress: () {},
          ),
          const Divider(),
          const SizedBox(height: 10),
          BlocBuilder<ThemeCubit, ThemeState>(
            bloc: getIt<ThemeCubit>(),
            builder: (context, state) {
              var bloc = getIt<ThemeCubit>();

              return ProfileMenuWidget(
                title: "Dark Theme",
                icon: FontAwesomeIcons.moon,
                onPress: () {},
                endWidget: Switch(
                    value: state.isDarkTheme,
                    onChanged: (value) => bloc
                        .setTheme(value ? ThemeMode.dark : ThemeMode.light)),
              );
            },
          ),
          ProfileMenuWidget(
            title: "Help Center",
            icon: FontAwesomeIcons.headphonesSimple,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
