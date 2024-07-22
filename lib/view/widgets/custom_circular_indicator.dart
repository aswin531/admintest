import 'dart:math';

import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends CustomPainter {
  final double value; // Progress value (0.0 - 1.0)
  final Color backgroundColor; // Background color of the circle
  final Color foregroundColor; // Color of the progress arc

  MyCircularProgressIndicator({
    required this.value,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0 // Adjust stroke width as needed
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2); // Required argument
    final radius = size.width / 2 - paint.strokeWidth / 2; // Required argument

    canvas.drawCircle(center, radius, paint); // Draw background circle

    final arcPaint = Paint()
      ..color = foregroundColor
      ..strokeWidth = 10.0 // Adjust stroke width as needed
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Set stroke cap for rounded edges

    final double sweepAngle = value * 2 * pi; // Calculate arc sweep angle
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, sweepAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true; // Rebuild when properties change
}
