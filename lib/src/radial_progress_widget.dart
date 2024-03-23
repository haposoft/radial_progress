import 'package:flutter/material.dart';
import 'package:radial_progress/src/radial_painter.dart';
import 'package:radial_progress/src/utils.dart';

/// ## [RadialProgressWidget] Class Documentation
///
/// The `RadialProgressWidget` widget is a stateful widget that provides a customizable radial progress
/// indicator. It supports animation of the progress indicator and allows customization of various properties
/// such as diameter, line width, colors, and animation duration.
///
/// ### Parameters:
/// - `percent`: The percentage of progress completed (value between 0.0 and 1.0).
/// - `diameter`: The diameter of the circular progress indicator (default is 80).
/// - `margin`: The margin applied around the circular progress indicator.
/// - `padding`: The padding applied inside the circular progress indicator.
/// - `progressLineWidth`: The width of the progress line.
/// - `bgLineColor`: The background color of the circular progress indicator.
/// - `progressLineColors`: A list of colors for the progress line. The color changes based on the progress
///   percentage (optional).
/// - `centerChild`: The widget to be centered inside the circular progress indicator.
/// - `enableAnimation`: Flag to enable or disable animation of the progress indicator (default is true).
/// - `animationDuration`: The duration of the animation (default is 1 second).
/// - `startAngle`: The starting angle of the progress indicator. It can be one of the values from the
///   `StartAngle` enum (optional).
///
/// ### Usage Example:
///
/// ```dart
/// RadialProgressWidget(
///   percent: 0.75,
///   diameter: 100,
///   margin: EdgeInsets.all(16),
///   padding: EdgeInsets.all(8),
///   progressLineWidth: 12,
///   bgLineColor: Colors.grey,
///   progressLineColors: [Colors.blue, Colors.green],
///   centerChild: Text('75%'),
///   enableAnimation: true,
///   animationDuration: Duration(seconds: 2),
///   startAngle: StartAngle.start,
/// );
/// ```
///
/// Developers can use this widget to create radial progress indicators with customizable properties
/// and optional animation support.
class RadialProgressWidget extends StatefulWidget {
  RadialProgressWidget({
    required this.percent,
    this.diameter = 80,
    this.margin,
    this.padding,
    this.progressLineWidth = 10,
    this.bgLineColor,
    this.progressLineColors,
    this.centerChild,
    this.enableAnimation = true,
    this.animationDuration,
    this.startAngle,
    this.callback,
    super.key,
  }) {
    assert(percent >= 0.0 && percent <= 1.0,
        'The percentage should be between 0.0 and 1.0');
  }

  final double percent;
  final double diameter;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double progressLineWidth;
  final Color? bgLineColor;
  final List<Color>? progressLineColors;
  final Widget? centerChild;
  final bool enableAnimation;
  final Duration? animationDuration;
  final StartAngle? startAngle;
  final void Function(double)? callback;

  @override
  State<RadialProgressWidget> createState() => _RadialProgressWidgetState();
}

class _RadialProgressWidgetState extends State<RadialProgressWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _animationController;
  late final Animation<double> _tweenAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration ?? const Duration(seconds: 1),
      );
      _tweenAnimation =
          Tween(begin: 0.0, end: widget.percent).animate(_animationController!);
      _animationController.forward();

      if (widget.callback != null) {
        _tweenAnimation.addListener(() {
          widget.callback!(_tweenAnimation.value);
        });
      }
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return widget.enableAnimation
            ? AnimatedBuilder(
                animation: _animationController!,
                builder: (context, child) {
                  return RadialProgress(
                    percent: _tweenAnimation.value,
                    diameter: widget.diameter,
                    padding: widget.padding,
                    progressLineWidth: widget.progressLineWidth,
                    bgLineColor: widget.bgLineColor,
                    progressLineColors: widget.progressLineColors,
                    centerChild: widget.centerChild,
                    startAngle: widget.startAngle,
                  );
                },
              )
            : RadialProgress(
                percent: widget.percent,
                diameter: widget.diameter,
                padding: widget.padding,
                progressLineWidth: widget.progressLineWidth,
                bgLineColor: widget.bgLineColor,
                progressLineColors: widget.progressLineColors,
                centerChild: widget.centerChild,
                startAngle: widget.startAngle,
              );
      },
    );
  }
}

/// ## [RadialProgress] Class Documentation
///
/// The `RadialProgress` widget displays a radial progress indicator, which is represented as a circular
/// shape with a progress line that fills a portion of the circle based on the specified percentage.
///
/// ### Parameters:
/// - `percent`: The percentage of progress completed (value between 0.0 and 1.0).
/// - `diameter`: The diameter of the circular progress indicator (default is 80).
/// - `margin`: The margin applied around the circular progress indicator.
/// - `padding`: The padding applied inside the circular progress indicator.
/// - `progressLineWidth`: The width of the progress line.
/// - `bgLineColor`: The background color of the circular progress indicator.
/// - `progressLineColors`: A list of colors for the progress line. The color changes based on the progress
///   percentage (optional).
/// - `centerChild`: The widget to be centered inside the circular progress indicator.
/// - `startAngle`: The starting angle of the progress indicator. It can be one of the values from the
///   `StartAngle` enum (default is `StartAngle.top`).
///
/// ### Usage Example:
///
/// ```dart
/// RadialProgress(
///   percent: 0.75,
///   diameter: 100,
///   margin: EdgeInsets.all(16),
///   padding: EdgeInsets.all(8),
///   progressLineWidth: 12,
///   bgLineColor: Colors.grey,
///   progressLineColors: [Colors.blue, Colors.green],
///   centerChild: Text('75%'),
///   startAngle: StartAngle.start,
/// );
/// ```
///
/// Developers can use this widget to create circular progress indicators with customizable properties
/// such as diameter, line width, colors, and starting angle.
class RadialProgress extends StatelessWidget {
  const RadialProgress({
    required this.percent,
    this.diameter = 80,
    this.margin,
    this.padding,
    this.progressLineWidth = 10,
    this.bgLineColor,
    this.progressLineColors,
    this.centerChild,
    this.startAngle,
    super.key,
  }) : _gapPadding = (progressLineWidth > (diameter / 3))
            ? diameter / 6
            : progressLineWidth / 2;

  final double percent;
  final double diameter;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double progressLineWidth;
  final Color? bgLineColor;
  final List<Color>? progressLineColors;
  final Widget? centerChild;
  final StartAngle? startAngle;

  final double _gapPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      margin: margin ?? EdgeInsets.all(_gapPadding),
      padding: padding,
      child: CustomPaint(
        foregroundPainter: RadialPainter(
          bgColor: bgLineColor ?? Colors.grey.shade200.withOpacity(0.6),
          lineColor: radialProgressLineColors(
            colors: progressLineColors ?? [],
            percent: percent,
          ),
          percent: percent,
          width: (progressLineWidth > (diameter / 3))
              ? diameter / 3
              : progressLineWidth,
          startAngle: startAngle,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(_gapPadding),
            child: centerChild,
          ),
        ),
      ),
    );
  }
}
