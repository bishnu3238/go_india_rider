 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'profile_manu_widget.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ProfileMenuWidget(
            title: "My Addresses",
            icon: FontAwesomeIcons.solidAddressBook,
            onPress: () {},
          ),
          ProfileMenuWidget(
            title: "My Reviews",
            icon: FontAwesomeIcons.rankingStar,
            onPress: () {},
          ),
          ProfileMenuWidget(
            title: "My Points",
            icon: FontAwesomeIcons.wallet,
            onPress: () {

            },
          ),
        ],
      ),
    );
  }
}
