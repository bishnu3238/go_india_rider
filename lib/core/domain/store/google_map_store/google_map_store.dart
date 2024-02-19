import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'google_map_state.dart';


class GoogleMapStore extends Cubit<GoogleMapState>{
  GoogleMapStore(): super(GoogleMapState());


  setMapType(MapType mapType){
    emit(state.copyWith(mapType: mapType));
  }

}