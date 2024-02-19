import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:package/package.dart';
import '../../../../../utils/widgets/widgets/widget.dart';
import '../core/cubit.dart';
import '../core/state.dart';
import 'logout_button.dart';
 import 'settings_manu.dart';
import 'user_options.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        var cubit = context.read<SettingCubit>();
        return Column(
          children: [
            /// -- IMAGE
            ProfileImageWithEdit(
              src: state.user.profileImgPath,
              onTap: () => cubit.pickUpdateImage(context),
            ),
            const SizedBox(height: 10),
            AutoSizeText(state.user.name,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(state.user.email,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: kDark),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            /// -- USER OPTIONS
            const UserOptions(),

            /// -- MENU
            const SettingMenu(),

            /// -- LOGOUT BUTTON
            LogoutButton(cubit: cubit),
          ],
        );
      },
    );
  }
}

