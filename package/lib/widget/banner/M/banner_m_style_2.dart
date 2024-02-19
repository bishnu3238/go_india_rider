 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constant/decoration/padding_margin.dart';
import '../banner_discount_tag.dart';
import 'banner_m.dart';


class BannerMStyle2 extends StatelessWidget {
  const BannerMStyle2({
    Key? key,
    this.image = "https://i.imgur.com/J1Qjut7.png",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountPercent,
  }) : super(key: key);
  final String? image;
  final String title;
  final String? subtitle;
  final int discountPercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: edgeInsets16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style:   const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: p16 / 4),
                    if (subtitle != null)
                      Text(
                        subtitle!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: p16),
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Arrow - Right.svg",
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: BannerDiscountTag(percentage: discountPercent),
        ),
      ],
    );
  }
}
