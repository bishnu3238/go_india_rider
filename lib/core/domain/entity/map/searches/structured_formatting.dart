import 'package:equatable/equatable.dart';

class StructuredFormattingModel extends Equatable {
  final String? mainText, secondaryText;

  const StructuredFormattingModel(
      {  this.mainText,   this.secondaryText});

  @override
  String toString() =>
      'StructuredFormatting{ mainText: $mainText, secondaryText: $secondaryText,}';

  StructuredFormattingModel copyWith({
    String? mainText,
    String? secondaryText,
  }) {
    return StructuredFormattingModel(
      mainText: mainText ?? this.mainText,
      secondaryText: secondaryText ?? this.secondaryText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mainText': mainText,
      'secondaryText': secondaryText,
    };
  }

  factory StructuredFormattingModel.fromMap(Map<String, dynamic> map) {
    return StructuredFormattingModel(
      mainText: map['main_text'] as String,
      secondaryText: map['secondary_text'] as String,
    );
  }

  @override
  List<Object?> get props => [mainText, secondaryText];
}
