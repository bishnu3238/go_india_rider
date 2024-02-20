import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:package/package.dart';
import 'package:flutter/material.dart';
import '../core/place_search_cubit.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/place_search_state.dart';

class PlaceSearchFields extends StatelessWidget {
  const PlaceSearchFields({super.key});

  @override
  Widget build(BuildContext context) {
    return CardX.column(
      elevation: 5,
      listOfWidget: const [
        PickupLocationField(),
        Divider(),
        DestinationLocationField(),
      ],
    );
  }
}

class PickupLocationField extends StatefulWidget {
  const PickupLocationField({super.key});

  @override
  State<PickupLocationField> createState() => _PickupLocationFieldState();
}

class _PickupLocationFieldState extends State<PickupLocationField> {
  late PlaceSearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<PlaceSearchCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
      builder: (context, state) {
        return TextFormField(
          controller: state.pickupController,
          style: StyleX.urbanistMedium(context),
          onTap: () {
            state.pickupController.selection =
                TextSelection(baseOffset: 0, extentOffset: state.pickupController.length);
            cubit.searchType(PlaceSearchType.pickup);
          },
          onChanged: cubit.placeAutoSearch,
          decoration: InputDecoration(
            isDense: true,
            enabled: true,
            prefixIcon: FavIcon(
              size: 18,
              iconColor: kGreen,
              icon: state.placeSearchType == PlaceSearchType.pickup
                  ? FontAwesomeIcons.solidCircle
                  : FontAwesomeIcons.circle,
              onTap: () {
                state.destinationController.selection = TextSelection(
                    baseOffset: 0, extentOffset: state.destinationController.length);
                cubit.searchType(PlaceSearchType.destination);
              },
            ),
            suffixIcon: FavIcon(
              size: 18,
              onTap: () {},
              iconColor: color.scrim,
              icon: FontAwesomeIcons.mapLocationDot,
            ),
            hintText: 'Pickup location',
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        );
      },
    );
  }
}

class DestinationLocationField extends StatefulWidget {
  const DestinationLocationField({super.key});

  @override
  State<DestinationLocationField> createState() => _DestinationLocationFieldState();
}

class _DestinationLocationFieldState extends State<DestinationLocationField> {
  late PlaceSearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<PlaceSearchCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    return BlocBuilder<PlaceSearchCubit, PlaceSearchState>(
        bloc: cubit,
        builder: (context, state) {
          return TextFormField(
            style: StyleX.urbanistMedium(context),
            controller: state.destinationController,
            onTap: () {
              state.destinationController.selection = TextSelection(
                  baseOffset: 0, extentOffset: state.destinationController.length);
              cubit.searchType(PlaceSearchType.destination);
            },
            onChanged: cubit.placeAutoSearch,
            decoration: InputDecoration(
              isDense: true,
              enabled: true,
              prefixIcon: FavIcon(
                size: 18,
                iconColor: color.error,
                icon: state.placeSearchType == PlaceSearchType.destination
                    ? FontAwesomeIcons.solidCircle
                    : FontAwesomeIcons.circle,
                onTap: () {
                  state.destinationController.selection = TextSelection(
                      baseOffset: 0, extentOffset: state.destinationController.length);
                  cubit.searchType(PlaceSearchType.destination);
                },
              ),
              suffixIcon: state.placeSearchType == PlaceSearchType.destination
                  ? FavIcon(
                      icon: FontAwesomeIcons.x,
                      size: 15,
                      onTap: cubit.removeFieldValue,
                      iconColor: color.primary,
                    )
                  : const SizedBox(),
              hintText: "Destination location",
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          );
        });
  }
}
