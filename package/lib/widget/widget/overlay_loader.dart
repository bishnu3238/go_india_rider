import "package:flutter/material.dart";
import "dart:ui";

import "package:package/package.dart";

class OverlayLoader extends StatelessWidget {
  final bool isLoading;

  final double opacity;

    final Color? color;

  late final Widget progressIndicator;

  final Offset? offset;

  final bool dismissible;

  final Widget child;

  final double blur;

  OverlayLoader({
    Key? key,
    required this.isLoading,
    this.opacity = 0.3,
    this.offset,
    this.dismissible = false,
    required this.child,
    Widget? progressIndicator,
    this.blur = 0.0, this.color,
  }) : super(key: key) {
    this.progressIndicator = progressIndicator ?? const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? Theme.of(context).colorScheme.outline;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator,
      );
    }

    return Stack(
      children: [
        child,
        if (isLoading) ...[
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          layOutProgressIndicator,
        ],
      ],
    );
  }
}
