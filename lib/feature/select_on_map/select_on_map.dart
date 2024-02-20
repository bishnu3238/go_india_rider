import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_india_rider/core/constant/image.dart';
import 'package:go_india_rider/core/domain/entity/export.dart';
import 'package:go_india_rider/core/domain/repository/export.dart';
import 'package:go_india_rider/utils/constant/global_variables.dart';
import 'package:go_india_rider/utils/widgets/icons/svg_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package/constant/decoration/colors.dart';
import 'package:package/package.dart';
import '../../core/domain/store/export.dart';

class SelectOnMap extends StatefulWidget {
  const SelectOnMap({super.key});

  @override
  State<SelectOnMap> createState() => _SelectOnMapState();
}

class _SelectOnMapState extends State<SelectOnMap> {
  late UserLocationStore userLocationStore;
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  late LatLng currentPosition;
  bool isMapMoved = false;

  @override
  void initState() {
    super.initState();
    userLocationStore = context.read<UserLocationStore>();
    init(context);
  }

  init(BuildContext context) {
    currentPosition = userLocationStore.state.currentLocation.latLng;
    initialCameraPosition = CameraPosition(
      target: userLocationStore.state.currentLocation.latLng,
      zoom: 14,
    );
  }

  LocationType _locationType = LocationType.pickup;
  String? pickupAddress;
  String? destinationAddress;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Stack(
      children: [
        GoogleMap(
          compassEnabled: true,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
          onCameraIdle: _onCameraIdle,
          myLocationButtonEnabled: true,
          gestureRecognizers: _gestureRecognizers,
          initialCameraPosition: CameraPosition(target: currentPosition, zoom: 14),
          mapType: context.watch<GoogleMapStore>().state.mapType,
        ),
        Align(
          alignment: Alignment.center,
          child: SvgPicture.string(
            ImgCon.mapPinSvgIcon,
            height: 40,
            width: 40,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Card(
              child: Padding(
                padding: 12.15.pxSy,
                child: Column(
                  children: [
                    RadioListTile(
                      dense: true,
                      shape: roundBorder12,
                      tileColor:
                          pickupAddress != null ? color.primary.withOpacity(0.2) : null,
                      title: AutoSizeText(pickupAddress ?? 'Pick up location'),
                      value: LocationType.pickup,
                      groupValue: _locationType,
                      onChanged: (LocationType? type) =>
                          setState(() => _locationType = type!),
                      // selected: pickupAddress != null,
                    ),
                    const SizedBox(height: 5),
                    RadioListTile(
                      dense: true,
                      shape: roundBorder12,
                      tileColor:
                          pickupAddress != null ? color.primary.withOpacity(0.2) : null,
                      title: AutoSizeText(destinationAddress ?? 'Drop Location'),
                      value: LocationType.destination,
                      groupValue: _locationType,
                      onChanged: (LocationType? type) =>
                          setState(() => _locationType = type!),
                      // selected: pickupAddress != null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: SizedBox(
            width: double.maxFinite,
            child: Card(
              color: color.primary,
              child: ButtonX(
                  onTap: () {},
                  child: Text(
                    "DONE",
                    style: StyleX.urbanistSemiBold(context)
                        .copyWith(color: color.background),
                  )),
            ),
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition? cameraPosition) {
    setState(() => currentPosition = cameraPosition!.target);
  }

  void _onCameraIdle() {
    getIt<MapRepository>()
        .getAddressFromGeographyCoordinates(currentPosition)
        .then((value) => value.fold(
              (l) => null,
              (r) => setLocation(r),
            ));
  }

  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers = {
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
  };

  setLocation(r) {
    if (_locationType == LocationType.pickup) {
      pickupAddress = r;
    } else {
      destinationAddress = r;
    }
    setState(() {});
  }
}
