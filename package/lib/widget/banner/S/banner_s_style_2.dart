import 'package:flutter/material.dart';

 import '../../../constant/decoration/padding_margin.dart';
import 'banner_s.dart';
 
class BannerSStyle2 extends StatelessWidget {
  const BannerSStyle2(
      {Key? key,
      this.image = "https://i.imgur.com/taodfci.png",
      required this.title,
      this.subttile,
      this.bottomText,
      required this.press})
      : super(key: key);

  final String image, title;
  final String? subttile, bottomText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image,
      press: press,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (subttile != null)
                Text(
                  subttile!,
                  style: const TextStyle(
                    color: Colors.white,
                     fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (subttile != null) const SizedBox(height: p16 / 4),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                   fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              if (bottomText != null)
                const SizedBox(height: p16 / 4),
              if (bottomText != null)
                Container(
                  padding:   const EdgeInsets.symmetric(
                      horizontal: p16 / 2,
                      vertical: p16 / 4),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                        Radius.circular(12 * 2)),
                  ),
                  child: Text(
                    bottomText!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black54,
                       fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
