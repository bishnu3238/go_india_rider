import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body/home_bottom_nav_bar.dart';
import 'core/home_cubit.dart';
import 'core/home_state.dart';

class Home extends StatelessWidget {
  Home({super.key,  required this. cubit});
   final HomeCubit cubit;

  final keys = GlobalKey<ScaffoldState>(debugLabel: 'home');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          key: keys,
          body: state.params.navigationShell,
          bottomNavigationBar:   HomeBottomNavigationBar(cubit: cubit),
        );
      }
    );
  }
}
