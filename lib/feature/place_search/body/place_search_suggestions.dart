import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/constant/constant.dart';

import '../../../core/domain/entity/export.dart';
import '../core/place_search_cubit.dart';
import '../core/place_search_state.dart';

class PlaceSearchSuggestions extends StatelessWidget {
  const PlaceSearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PlaceSearchCubit>(context);
    var color = Theme.of(context).colorScheme;
    return BlocConsumer<PlaceSearchCubit, PlaceSearchState>(
      listener: (cts, state) {},
      builder: (ctx, state) => state.predictions.isEmpty
          ? Center(
              child: Text("No Search place found", style: StyleX.urbanistSmall(context)),
            )
          : ListView.builder(
              primary: true,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.predictions.length,
              itemBuilder: (ctx, index) {
                TextSearchResultModel pre = state.predictions[index];

                return ListTile( 
                  dense: true,
                  title: AutoSizeText(pre.address!),
                  leading: const Icon(FontAwesomeIcons.mapPin),
                  trailing: Icon(
                    FontAwesomeIcons.clockRotateLeft,
                    color: color.shadow.withOpacity(0.2),
                  ),
                  onTap: () => cubit.updatePickupLocation(pre),
                );
              },
            ),
    );
  }
}
