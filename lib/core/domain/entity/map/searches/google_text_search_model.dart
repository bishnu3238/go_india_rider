import 'package:equatable/equatable.dart';

import '../../export.dart';



class GoogleTextSearchModel   extends Equatable{

  final String? status;
  final List<TextSearchResultModel> resultModel;

  const GoogleTextSearchModel({
    required this.status,
    required this.resultModel,
  });

  GoogleTextSearchModel copyWith({
    String? status,
    List<TextSearchResultModel>? resultModel,
  }) =>
      GoogleTextSearchModel(
        status: status ?? this.status,
        resultModel: resultModel ?? this.resultModel,
      );

  factory GoogleTextSearchModel.fromMap(Map<String, dynamic> map) {
    return GoogleTextSearchModel(
      status: map['status'] as String? ?? "",
      resultModel: map['results'] != null
          ? (map['results'] as List)
          .map<TextSearchResultModel>(
              (e) => TextSearchResultModel.fromMap(e))
          .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [status, resultModel];
}





