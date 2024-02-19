import 'package:flutter/material.dart';
 import 'package:package/package.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size = 30.0});
  final double size;

  static chasingSpinner({Color? color, double? size = 50.0, required BuildContext context}) {
    return SpinKitChasingDots(
        color: color ?? Theme.of(context).colorScheme.secondary, size: size!);
  }

  static threeBounce({Color? color, double? size = 50.0, required BuildContext context}) {
    return SpinKitThreeBounce(
        color: color ?? Theme.of(context).colorScheme.secondary, size: size!);
  }

  static fadingCircle({Color? color, double? size = 50.0, required BuildContext context}) {
    return SpinKitFadingCircle(
        color: color ?? Theme.of(context).colorScheme.secondary, size: size!);
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
