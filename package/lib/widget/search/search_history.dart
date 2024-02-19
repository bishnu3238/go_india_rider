import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.history),
      title: Text('color.label'),
      trailing: IconButton(
        icon: const Icon(Icons.call_missed),
        onPressed: () {
          // controller.text = color.label;
          // controller.selection = TextSelection.collapsed(offset: controller.text.length);
        },
      ),
    );
  }
}



