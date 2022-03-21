library square_progress_bar;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:square_progress_bar/radial_painter.dart';

// Progress bar widget
// ignore: must_be_immutable
class SquareProgressBar extends StatefulWidget {
  final double progress;
  double? width;
  double? height;
  final Color solidBarColor;
  final Color emptyBarColor;
  final double strokeWidth;
  final StrokeCap barStrokeCap;
  LinearGradient? gradientBarColor;
  final bool isAnimation;
  final Duration animationDuration;
  final bool isRtl;
  Widget? child;

  SquareProgressBar({
    Key? key,
    required this.progress,
    this.solidBarColor = Colors.blue,
    this.emptyBarColor = Colors.grey,
    this.gradientBarColor,
    this.strokeWidth = 15,
    this.barStrokeCap = StrokeCap.round,
    this.isAnimation = false,
    this.animationDuration = const Duration(seconds: 2),
    this.isRtl = false,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  State<SquareProgressBar> createState() => _SquareProgressBarState();
}

class _SquareProgressBarState extends State<SquareProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  // only initiate the animation controller if isAnimation is true
  @override
  void initState() {
    super.initState();

    if (!widget.isAnimation) return;

    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    animationController?.forward();
  }

  // - if size is not specified the progress bar size will set to biggest size available
  // - if isRtl is true the progres bar will rotate 180°
  // - if isRtl is true the progres bar child widget will rotate 180° which will rotate the child widget to it's original angle
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: widget.width ?? constraint.biggest.width,
          height: widget.height ?? constraint.biggest.height,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(widget.isRtl ? math.pi : 0),
            child: CustomPaint(
              painter: RadialPainter(
                animationController: animationController,
                progress: widget.progress,
                isAnimation: widget.isAnimation,
                solidBarColor: widget.solidBarColor,
                emptyBarColor: widget.emptyBarColor,
                gradientBarColor: widget.gradientBarColor,
                strokeWidth: widget.strokeWidth,
                barStrokeCap: widget.barStrokeCap,
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(widget.isRtl ? math.pi : 0),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }

  // disposing the animation controller for preventing memory leak
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
