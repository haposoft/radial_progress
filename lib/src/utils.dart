import 'dart:math';

import 'package:flutter/material.dart';

/// ## Enum [StartAngle] Documentation
///
/// The `StartAngle` enum represents the starting angle for drawing a radial progress indicator.
///
/// It provides the following options:
/// - `start`: The starting angle is at the beginning of the progress indicator.
/// - `end`: The starting angle is at the end of the progress indicator.
/// - `top`: The starting angle is at the top of the progress indicator.
/// - `bottom`: The starting angle is at the bottom of the progress indicator.
///
/// ### Usage Example:
///
/// ```dart
/// StartAngle angle = StartAngle.start;
/// ```
///
/// Developers can use this enum to specify the starting angle when customizing radial progress indicators.
enum StartAngle {
  start,
  end,
  top,
  bottom,
}

/// ## [convertStartAngleToDesiredDegree] Function Documentation
///
/// The `convertStartAngleToDesiredDegree` function converts a `StartAngle` enum value
/// into the corresponding degree value for drawing a radial progress indicator.
///
/// ### Parameters:
/// - `startAngle`: The `StartAngle` enum value representing the desired starting angle.
///
/// ### Returns:
/// A double value representing the degree for the specified starting angle.
///
/// ### Usage Example:
///
/// ```dart
/// double degree = convertStartAngleToDesiredDegree(StartAngle.top);
/// ```
///
/// Developers can use this function to convert a `StartAngle` enum value into its corresponding
/// degree value when customizing the starting angle of radial progress indicators.
double convertStartAngleToDesiredDegree(StartAngle startAngle) {
  return switch(startAngle) {
    StartAngle.start => pi,
    StartAngle.end => 0.0,
    StartAngle.top => -pi / 2,
    StartAngle.bottom => pi / 2,
  };
}

/// ## [radialProgressLineColors] Function Documentation
///
/// The `radialProgressLineColors` function calculates the color for a radial progress line based on the
/// specified percentage and a list of gradient colors.
///
/// ### Parameters:
/// - `colors`: A list of `Color` objects representing the gradient colors.
/// - `percent`: A double value representing the percentage of progress completed.
///
/// ### Returns:
/// A `Color` object representing the color of the radial progress line at the given percentage.
/// If the `colors` list is empty, it returns the default color `Colors.cyan`. If the `percent` value
/// is outside the valid range [0, 1], it also returns the default color.
///
/// ### Usage Example:
///
/// ```dart
/// Color progressColor = radialProgressLineColors(colors: [Colors.red, Colors.blue], percent: 0.5);
/// ```
///
/// Developers can use this function to determine the color of a radial progress line based on the
/// progress percentage and a list of gradient colors.
Color radialProgressLineColors({
  required List<Color> colors,
  required double percent,
}) {
  Color progressLineColor = Colors.cyan;

  if (colors.isEmpty) {
    return progressLineColor;
  }

  if (percent < 0.0 || percent > 1.0) {
    return progressLineColor;
  }

  final ref = 1 / colors.length;
  for (int i = 0; i < colors.length; i++) {
    if (percent ~/ ref == i) {
      progressLineColor = colors[i];
    }
  }
  return progressLineColor;
}
