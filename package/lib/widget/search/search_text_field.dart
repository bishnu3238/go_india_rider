import 'package:flutter/material.dart';
import 'package:package/package.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.suggestionsBuilder});

  final SuggestionsBuilder suggestionsBuilder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.8.pxSy,
      alignment: Alignment.bottomCenter,
      child: SearchAnchor.bar(
        isFullScreen: true,
        onTap: () => FocusScope.of(context).unfocus(),
        barTrailing: [Icon(Icons.mic)],
        barShape: MaterialStatePropertyAll(roundBorder5),
        barPadding: const MaterialStatePropertyAll(edgeInsets5),
        constraints: BoxConstraints(
          maxHeight: getVerticalSize(50),
          minHeight: getVerticalSize(35),
        ),
        viewConstraints: BoxConstraints.tightFor(
          width: getHorizontalSize(50),
          height: getVerticalSize(50),
        ),
        suggestionsBuilder: suggestionsBuilder,
      ),
    );
  }
}

enum SearchDataType { item, brand, category }

class SearchData {
  String id, name;
  String? image;
  SearchDataType type;
  SearchData(
      {required this.id, required this.name, this.image, required this.type});
  factory SearchData.fromMap(Map<String, dynamic> map) {
    return SearchData(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      type: map['type'],
    );
  }
}
