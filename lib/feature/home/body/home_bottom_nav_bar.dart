import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/package.dart';

import '../core/home_cubit.dart';
import '../core/home_state.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key, required this. cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 5,
          selectedItemColor: color.primary,
          currentIndex: state.params.navigationShell!.currentIndex,
          backgroundColor: color.background,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: StyleX.inter(context),
          unselectedLabelStyle: StyleX.inter(context),
          unselectedItemColor: color.onPrimaryContainer.withOpacity(0.7),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear),
              label: 'Settings',
            ),
          ],
          onTap: cubit.nextBranch,
        );
      },
    );
  }
}
