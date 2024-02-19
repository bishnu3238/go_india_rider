import 'package:flutter/material.dart';
import 'package:package/constant/constant.dart';



class OfferTag extends StatelessWidget {
  const OfferTag({
    super.key,
    required this.discountPercent,
  });

  final int? discountPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: p16 / 2),
      height: 16,
      decoration:   BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        "$discountPercent% off",
        style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
