import 'package:equatable/equatable.dart';

import 'auto_complete_prediction.dart';

class PlaceAutoCompleteResponseModel extends Equatable {
  final String status;
  final List<AutoCompletePredictionModel> predictions;

  const PlaceAutoCompleteResponseModel({
    required this.status,
    required this.predictions,
  });

  PlaceAutoCompleteResponseModel copyWith({
    String? status,
    List<AutoCompletePredictionModel>? predictions,
  }) =>
      PlaceAutoCompleteResponseModel(
        status: status ?? this.status,
        predictions: predictions ?? this.predictions,
      );

  factory PlaceAutoCompleteResponseModel.fromMap(Map<String, dynamic> map) {
    return PlaceAutoCompleteResponseModel(
      status: map['status'] as String? ?? "",
      predictions: map['predictions'] != null
          ? (map['predictions'] as List)
              .map<AutoCompletePredictionModel>(
                  (e) => AutoCompletePredictionModel.fromMap(e))
              .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [status, predictions];
}
