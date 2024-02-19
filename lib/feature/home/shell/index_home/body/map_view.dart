import 'dart:async';
import 'package:go_india_rider/core/domain/store/export.dart';
import 'package:package/package.dart';
import '../core/index_home_bloc.dart';
import 'package:flutter/gestures.dart';
import '../core/index_home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/repository/export.dart';
import '../../../../../utils/constant/global_variables.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  ///
  ///
  late IndexHomeBloc bloc;

  ///
  ///
  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> _controller = Completer();

  ///
  ///
  LatLng? _pickLocation;
  CameraPosition get _initialCameraPosition => bloc.initialCameraPosition;
  Position? _userCurrentPosition;
  Geolocator geoLocator = Geolocator();
  List<LatLng> _polyLineCoordinates = [];
  final Set<Polyline> _polyLines = {};
  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};

  BitmapDescriptor? activeNearByIcon;

  @override
  void initState() {
    super.initState();
    bloc = context.read<IndexHomeBloc>();
    bloc.checkingUserLocation(context);
  }

  // Future getDeviceCurrentLocation(BuildContext context) async {
  //  await getIt<LocationRepository>()
  //       .getCurrentLocation()
  //       .then((value) => value.fold((l) => null, (r) {
  //             _userCurrentPosition = r;
  //             LatLng target = LatLng(r.latitude, r.longitude);
  //             _initialCameraPosition = CameraPosition(
  //               target: target,
  //               zoom: 14,
  //             );
  //             googleMapController
  //                 .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  //             _markers.add(Marker(
  //               markerId: MarkerId(r.latitude.toString()),
  //               position: target,
  //             ));
  //
  //             _circles.add(Circle(
  //                 circleId: CircleId(r.latitude.toString()), radius: 30, center: target));
  //           }));
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexHomeBloc, IndexHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ClearFocus(
          child: GoogleMap(
            markers: bloc.markers,
            circles: _circles,
            polylines: bloc.polyLines,
            mapType: context.watch<GoogleMapStore>().state.mapType,
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
            onCameraIdle: _onCameraIdle,
            gestureRecognizers: _gestureRecognizers,
            initialCameraPosition: _initialCameraPosition,
            compassEnabled: false,
            zoomControlsEnabled: false,
          ),
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    context.read<IndexHomeBloc>().mapControllerRepository.controller.complete(controller);
    // _controller.complete(controller);
    // googleMapController = controller;
    setState(() {});
  }

  void _onCameraMove(CameraPosition? cameraPosition) {
    if (_pickLocation != cameraPosition!.target) {
      setState(() => _pickLocation = cameraPosition.target);
    }
  }

  void _onCameraIdle() {}

  final Set<Factory<OneSequenceGestureRecognizer>> _gestureRecognizers = {
    Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer()),
    // Factory<OneSequenceGestureRecognizer>(() => ScaleGestureRecognizer()),
  };
}
