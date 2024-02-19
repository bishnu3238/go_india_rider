import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package/package.dart';

class ProfileImageWithEdit extends StatelessWidget {
  const ProfileImageWithEdit({
    super.key,
    required this.src,
    this.onTap,
    this.width = 120.0,
    this.height = 120.0,
    this.icon = FontAwesomeIcons.penToSquare,
  });
  final String src;
  final IconData? icon;
  final VoidCallback? onTap;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Stack(
      children: [
        InkWell(
          onTap: () => showSheet(
            context: context,
            widget: (ctx) => NetworkImageWithLoader(src),
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CircleImageShower(src)),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color.primary),
              child: Icon(
                icon,
                color: color.background,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
