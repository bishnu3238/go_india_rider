 import 'package:flutter/material.dart';
import 'package:package/package.dart';
 import 'svg_image.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgImg(
      onPressed: () {},
      imgSrc: ImgPac.searchIconSvg,
      label: 'Search',
    );
  }
}
