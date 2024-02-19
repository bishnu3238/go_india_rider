import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  bool? ifFill;

  CirclePainter({
    this.ifFill,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = ifFill== false ? PaintingStyle.fill : PaintingStyle.stroke;

    canvas.drawCircle(
      center,
      size.width * 1 / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
