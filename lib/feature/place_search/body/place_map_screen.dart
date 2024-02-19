import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'place_search_suggestions.dart';

class PlaceMapScreen extends StatefulWidget {
  const PlaceMapScreen({super.key});

  @override
  State<PlaceMapScreen> createState() => _PlaceMapScreenState();
}

class _PlaceMapScreenState extends State<PlaceMapScreen> {
  @override
  Widget build(BuildContext context) {
    return const PlaceSearchSuggestions();
  }
}
