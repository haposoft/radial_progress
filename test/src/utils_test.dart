import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:radial_progress/src/utils.dart';

void main() {
  final colors = [
    Colors.red, // >= 0.0 - < 0.25
    Colors.orange, // >= 0.25 - < 0.5
    Colors.lightGreen, // >= 0.5 - < 0.75
    Colors.green, // >= 0.75 - < 1.0
  ];

  group(
    'Check `radialProgressLineColors()` functionality',
    () {
      test(
        'It should return `Colors.red` because the percentage is in the range of 0.2',
        () {
          // arrange
          const percent = 0.2;

          // act
          final result = radialProgressLineColors(
            colors: colors,
            percent: percent
          );

          // assert
          expect(result, Colors.red);
        },
      );

      test(
        'It should return `Colors.orange` because the percentage is in the range of 0.3',
        () {
          // arrange
          const percent = 0.3;

          // act
          final result = radialProgressLineColors(
            colors: colors,
            percent: percent
          );

          // assert
          expect(result, Colors.orange);
        },
      );

      test(
        'It should return `Colors.lightGreen` because the percentage is in the range of 0.5',
        () {
          // arrange
          const percent = 0.5;

          // act
          final result = radialProgressLineColors(
            colors: colors,
            percent: percent
          );

          // assert
          expect(result, Colors.lightGreen);
        },
      );

      test(
        'It should return `Colors.green` because the percentage is in the range of 0.75',
        () {
          // arrange
          const percent = 0.75;

          // act
          final result = radialProgressLineColors(
            colors: colors,
            percent: percent
          );

          // assert
          expect(result, Colors.green);
        },
      );

      test(
        'It should return `Colors.lightGreen` because the percentage is in the range of 0.74',
        () {
          // arrange
          const percent = 0.74;

          // act
          final result = radialProgressLineColors(
            colors: colors,
            percent: percent
          );

          // assert
          expect(result, Colors.lightGreen);
        },
      );

      test(
        'It should return `Colors.cyan` by default because color list is empty',
        () {
          // arrange
          const percent = 0.2;

          // act
          final result = radialProgressLineColors(
            colors: [],
            percent: percent
          );

          // assert
          expect(result, Colors.cyan);
        },
      );

      test(
        'It should return `Colors.cyan` by default because the percentage is in invalid range & color list is empty',
        () {
          // arrange
          const percent = 1.2;

          // act
          final result = radialProgressLineColors(
            colors: [],
            percent: percent
          );

          // assert
          expect(result, Colors.cyan);
        },
      );

      test(
        'It should return `Colors.cyan` by default because the percentage is in invalid range',
        () {
          // arrange
          const percent = 1.2;

          // act
          final result = radialProgressLineColors(
            colors: [
              Colors.red,
              Colors.pink,
              Colors.purple,
            ],
            percent: percent
          );

          // assert
          expect(result, Colors.cyan);
        },
      );

    },
  );

  group(
    'vase khali naboodane arize',
    () {
      test(
        'It should return `-pi / 2`',
        () {
          // arrange
          const matcher = -1.5707963267948966;

          // act
          final result = convertStartAngleToDesiredDegree(StartAngle.top);

          // assert
          expect(result, matcher);
        },
      );

      test(
        'It should return `pi / 2`',
        () {
          // arrange
          const matcher = 1.5707963267948966;

          // act
          final result = convertStartAngleToDesiredDegree(StartAngle.bottom);

          // assert
          expect(result, matcher);
        },
      );

      test(
        'It should return `pi`',
            () {
          // arrange
          const matcher = pi;

          // act
          final result = convertStartAngleToDesiredDegree(StartAngle.start);

          // assert
          expect(result, matcher);
        },
      );

      test(
        'It should return `0.0`',
            () {
          // arrange
          const matcher = 0.0;

          // act
          final result = convertStartAngleToDesiredDegree(StartAngle.end);

          // assert
          expect(result, matcher);
        },
      );
    },
  );
}