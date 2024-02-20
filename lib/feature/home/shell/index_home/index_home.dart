import 'package:flutter/material.dart';
import 'body/home_body.dart';
import 'body/index_app_bar.dart';


class IndexHome extends StatelessWidget {
  const IndexHome({super.key });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            IndexAppBar(),
            IndexHomeBody(),
          ],
        ),
      ),
    );
  }
}
