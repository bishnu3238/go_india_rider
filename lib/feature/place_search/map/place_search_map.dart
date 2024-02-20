import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package/package.dart';

import '../../../core/constant/constant.dart';
import '../../../core/domain/store/export.dart';
import '../../../utils/constant/global_variables.dart';
import '../../map_screen/core/map_cubit.dart';
import '../../map_screen/core/map_state.dart';
import 'core/place_search_map_initial_params.dart';

class PlaceSearchMap extends StatefulWidget {
  const PlaceSearchMap({super.key, required this.initialParams});

  final PlaceSearchMapInitialParams initialParams;

  @override
  State<PlaceSearchMap> createState() => _PlaceSearchMapState();
}

class _PlaceSearchMapState extends State<PlaceSearchMap> {
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  PolylineResult? _result;
  bool isMapMoved = false;
  List<LatLng> pointCoordinates = [];

  @override
  void initState() {
    super.initState();

    init(context);
  }

  init(BuildContext context) {
    initialCameraPosition = CameraPosition(
      target: context.read<UserLocationStore>().state.currentLocation.latLng,
      zoom: 14,
    );
    getRouteDirections();
  }

  Set<Marker> markers = {};
  // {
  //    var pickup = widget.initialParams.pickupLocation;
  //    var destination = widget.initialParams.destinationLocation;
  //    var breakJourney = widget.initialParams.breakJourneyLocation;
  //
  //    return {
  //      Marker(
  //          markerId: MarkerId(uid.v1()),
  //          position: pickup.latLng,
  //          infoWindow: const InfoWindow(title: 'Picnic garden', anchor: Offset(0, 0.5)),
  //          visible: true,
  //          consumeTapEvents: true,
  //          flat: true),
  //      Marker(markerId: MarkerId(uid.v1()), position: destination.latLng),
  //      ...breakJourney
  //          .map((e) => Marker(markerId: MarkerId(uid.v1()), position: e.latLng))
  //          .toList(),
  //    };
  //  }

  void getRouteDirections() async {
    PolylinePoints points = PolylinePoints();
    PolylineResult result = await points.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(widget.initialParams.pickupLocation.lat,
          widget.initialParams.pickupLocation.lng),
      PointLatLng(widget.initialParams.destinationLocation.lat,
          widget.initialParams.destinationLocation.lng),
    );
    _result = result;

    if (result.points.isNotEmpty) {
      markers.clear();
      markers.addAll(
        {
          Marker(
            markerId: MarkerId(uid.v1()),
            position: LatLng(result.points.first.latitude, result.points.first.longitude),
            visible: true,
            zIndex: 0.5,
            infoWindow: InfoWindow(
              title: result.startAddress,
              onTap: () => result.startAddress.log,
              snippet: result.startAddress,
            ),
          ),
          Marker(
            markerId: MarkerId(uid.v1()),
            position: LatLng(result.points.last.latitude, result.points.last.longitude),
            visible: true,
            zIndex: 0.5,
            onTap: () => result.endAddress.log,
            infoWindow: InfoWindow(
              title: result.endAddress,
              onTap: () => result.endAddress.log,
              snippet: result.endAddress,
            ),
          ),
        },
      );

      for (var element in result.points) {
        pointCoordinates.add(LatLng(element.latitude, element.longitude));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<MapCubit, MapState>(builder: (context, state) {
          return GoogleMap(
            markers: markers,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            gestureRecognizers: _gestureRecognizers,
            initialCameraPosition: initialCameraPosition,
            polylines: {
              Polyline(
                polylineId: PolylineId(uid.v1()),
                points: pointCoordinates,
                color: kBlueDeep,
                width: 4,
              )
            },
            mapType: context.watch<GoogleMapStore>().state.mapType,
          );
        }),
        _result == null
            ? const SizedBox()
            : Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CardX.column(
                  listOfWidget: [
                    ListTile(
                      title: Text(
                        'Estimated time: ${_result!.duration}',
                        style: StyleX.gentiumPlus(context),
                      ),
                      subtitle: Text('Duration: ${_result!.distance}'),
                    ),
                  ],
                ),
              ),
        Positioned(
          bottom: kToolbarHeight,
          right: 10,
          child: FloatingActionButton(
            onPressed: !isMapMoved
                ? null
                : () {
                    mapController.animateCamera(CameraUpdate.newLatLng(LatLng(
                        widget.initialParams.pickupLocation.lat,
                        widget.initialParams.pickupLocation.lng)));
                    setState(() => isMapMoved = false);
                  },
            shape: roundBorder50,
            child: !isMapMoved
                ? const Icon(Icons.my_location)
                : const Icon(Icons.location_searching),
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition? cameraPosition) {
    if (cameraPosition != null &&
        cameraPosition.target != widget.initialParams.pickupLocation.latLng) {
      setState(() => isMapMoved = true);
    } else {
      setState(() => isMapMoved = false);
    }
    cameraPosition!.target.log;
  }

  void _onCameraIdle() {}

  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers = {
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
  };
}
