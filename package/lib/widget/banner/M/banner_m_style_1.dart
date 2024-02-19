import 'package:flutter/material.dart';
import 'package:package/package.dart';

class BannerMStyle1 extends StatelessWidget {
  const BannerMStyle1({
    Key? key,
    this.image = "https://i.imgur.com/UP7xhPG.png",
    required this.text,
    this.imgType = ImgType.network,
    required this.press,
  }) : super(key: key);
  final String? image;
  final String text;
  final ImgType imgType;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
      image: image!,
      press: press,
      imgType: imgType,
      children: [
        // Padding(
        //   padding: edgeInsets16,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const Spacer(flex: 2),
        //       SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.75,
        //         child: Text(
        //           text,
        //           style: TextStyle(
        //             fontFamily: inter,
        //             fontWeight: FontWeight.w600,
        //             fontSize: 24,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ),
        //       const Spacer(),
        //       const Text(
        //         "Shop now",
        //         style: TextStyle(color: Colors.white, fontWeight: fw6),
        //       ),
        //       const SizedBox(
        //         width: 64,
        //         child: Divider(color: Colors.white, thickness: 2),
        //       ),
        //       const Spacer(flex: 2),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
