import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radial_progress/src/utils.dart';

/// ## [RadialPainter] Class Documentation
///
/// The `RadialPainter` class is a custom painter responsible for painting a radial progress indicator
/// on a canvas.
///
/// It draws a circular background and a portion of the circle representing the progress.
///
/// ### Parameters:
/// - `bgColor`: The background color of the circular progress indicator.
/// - `lineColor`: The color of the progress line.
/// - `percent`: The percentage of progress completed (value between 0.0 and 1.0).
/// - `width`: The width of the progress line.
/// - `startAngle`: The starting angle of the progress indicator. It can be one of the values
///   from the `StartAngle` enum (default is `StartAngle.top`).
///
/// ### Usage Example:
///
/// ```dart
/// RadialPainter(
///   bgColor: Colors.grey,
///   lineColor: Colors.blue,
///   percent: 0.75,
///   width: 10.0,
///   startAngle: StartAngle.start,
/// );
/// ```
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
/// - The `paint` method draws the background circle and progress arc on the canvas.
/// - The background circle's color and the progress arc's color and width are specified by the
///   `bgColor`, `lineColor`, and `width` parameters, respectively.
/// - The completion percentage (`percent`) determines the angle of the progress arc.
/// - This class extends `CustomPainter` and must be used within a `CustomPaint` widget.
///
/// Developers can use this class to create custom radial progress indicators with various colors,
/// line widths, and starting angles.
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
      convertStartAngleToDesiredDegree(startAngle ?? StartAngle.top),
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
