import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TextSearchResultModel extends Equatable {
  final String? address, name, placeId, reference;
  final LatLng latLng;

  const TextSearchResultModel({
    this.address,
    this.name,
    this.placeId,
    this.reference,
    required this.latLng,
  });

  @override
  String toString() {
    return 'TextSearchResultModel{ address: $address, name: $name, placeId: $placeId, reference: $reference, latLng: $latLng,}';
  }

  TextSearchResultModel copyWith({
    String? address,
    String? name,
    String? placeId,
    String? reference,
    LatLng? latLng,
  }) {
    return TextSearchResultModel(
      address: address ?? this.address,
      name: name ?? this.name,
      placeId: placeId ?? this.placeId,
      reference: reference ?? this.reference,
      latLng: latLng ?? this.latLng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'name': name,
      'placeId': placeId,
      'reference': reference,
      'latLng': latLng,
    };
  }

  factory TextSearchResultModel.fromMap(Map<String, dynamic> map) {
    return TextSearchResultModel(
      address: map['formatted_address'] as String? ?? "",
      name: map['name'] as String? ?? "",
      placeId: map['place_id'] as String,
      reference: map['reference'] as String,
      latLng: parseLatLng(map['geometry']['location']),
    );
  }

  static LatLng parseLatLng(Map<String, dynamic> map) =>
      LatLng(map['lat'], map['lng']);

  @override
  List<Object?> get props => [address, name, placeId, reference, latLng];
}
