import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/domain/store/export.dart';
import '../../utils/constant/global_variables.dart';
import '../home/shell/index_home/core/index_home_bloc.dart';
import '../map_screen/core/map_cubit.dart';
import '../place_search/core/place_search_cubit.dart';
import 'start.dart';

class GoBharatRider extends StatelessWidget {
  const GoBharatRider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /// stores
        BlocProvider(create: (ctx) => getIt<GoogleMapStore>()),
        BlocProvider(create: (ctx) => getIt<UserLocationStore>()),
        BlocProvider(
            create: (ctx) => getIt<ApplicationStore>()
              ..context = ctx
              ..init(),
            lazy: false),

        /// screens
        BlocProvider(create: (ctx) => getIt<IndexHomeBloc>()),
        BlocProvider(create: (ctx) => getIt<PlaceSearchCubit>()),
        BlocProvider(create: (ctx) => getIt<MapCubit>()),
      ],
      child: const Start(),
    );
  }
}
