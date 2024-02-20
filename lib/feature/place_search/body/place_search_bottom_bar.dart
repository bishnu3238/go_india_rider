import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package/constant/decoration/border_radius.dart';
import 'package:package/package.dart';

import '../core/place_search_cubit.dart';
import '../core/place_search_state.dart';

class PlaceSearchBottomBar extends StatelessWidget {
  const PlaceSearchBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
      builder: (context, state) {
        return state.isDone
            ? Container(
                width: double.infinity,
                height: kToolbarHeight,
                decoration: const BoxDecoration(shape: BoxShape.rectangle),
                alignment: Alignment.center,
                child: ButtonScale(
                  onTap: () {},
                  child: Text(
                    'Done',
                    style: StyleX.urbanist(context).copyWith(
                      fontSize: 22,
                      fontWeight: fwb,
                    ),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
