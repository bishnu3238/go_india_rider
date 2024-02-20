import 'package:equatable/equatable.dart';

import 'structured_formatting.dart';



class AutoCompletePredictionModel extends Equatable {
  final String description, placeId, reference;
  final StructuredFormattingModel? formatting;

  const AutoCompletePredictionModel({
    required this.description,
    required this.placeId,
    required this.reference,
      this.formatting,
  });

  @override
  String toString() =>
      'AutoCompletePrediction{ description: $description, placeId: $placeId, reference: $reference, formatting: $formatting,}';

  AutoCompletePredictionModel copyWith({
    String? description,
    String? placeId,
    String? reference,
    StructuredFormattingModel? formatting,
  }) {
    return AutoCompletePredictionModel(
      description: description ?? this.description,
      placeId: placeId ?? this.placeId,
      reference: reference ?? this.reference,
      formatting: formatting ?? this.formatting,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'placeId': placeId,
      'reference': reference,
      'formatting': formatting,
    };
  }
   factory AutoCompletePredictionModel.fromMap(Map<String, dynamic> map) {
    return AutoCompletePredictionModel(
      description: map['description'] as String,
      placeId: map['place_id'] as String,
      reference: map['reference'] as String,
      formatting: map['structured_formatting'] != null
          ? StructuredFormattingModel.fromMap(map['structured_formatting'])
          : null,
    );
  }

  @override
  List<Object?> get props => [description, placeId, reference, formatting];
}
