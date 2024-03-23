import 'dart:math';

import 'package:flutter/material.dart';

enum StartAngle {
  start,
  end,
  top,
  bottom,
}

double convertStartAngleToDesiredDegree(StartAngle startAngle) {
  return switch(startAngle) {
    StartAngle.start => pi,
    StartAngle.end => 0.0,
    StartAngle.top => -pi / 2,
    StartAngle.bottom => pi / 2,
  };
}

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
