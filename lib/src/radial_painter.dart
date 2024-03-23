import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radial_progress/src/utils.dart';

/// ## [RadialPainter] Class Documentation
///
/// The `RadialPainter` class is a custom painter used to draw a radial progress indicator.
/// It paints a background circle and a progress arc on a given canvas based on the specified
/// parameters.
///
/// Parameters:
///
/// - `bgColor`: The background color of the progress indicator.
/// - `lineColor`: The color of the progress arc indicating the completion.
/// - `percent`: The percentage of completion (0.0 to 1.0) represented by the progress arc.
/// - `width`: The width of the progress indicator lines.
///
/// Usage Example:
///
/// ```dart
/// CustomPaint(
///   painter: RadialPainter(
///     bgColor: Colors.grey[300]!,
///     lineColor: Colors.blue,
///     percent: 0.75,
///     width: 12.0,
///   ),
///   child: Container(
///     width: 200,
///     height: 200,
///   ),
/// )
/// ```
///
/// Notes:
///
/// - The `paint` method draws the background circle and progress arc on the canvas.
/// - The background circle's color and the progress arc's color and width are specified by the
///   `bgColor`, `lineColor`, and `width` parameters, respectively.
/// - The completion percentage (`percent`) determines the angle of the progress arc.
/// - This class extends `CustomPainter` and must be used within a `CustomPaint` widget.
class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;
  final StartAngle? startAngle;

  RadialPainter({
    required this.bgColor,
    required this.lineColor,
    required this.percent,
    required this.width,
    this.startAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLinePaint = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLinePaint = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);

    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, bgLinePaint);

    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      convertStartAngleToDesiredDegree(startAngle ?? StartAngle.top), //-pi / 2,
      sweepAngle,
      false,
      completeLinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
