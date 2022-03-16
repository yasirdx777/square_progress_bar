library square_progress_bar;

import 'package:flutter/material.dart';
import 'package:square_progress_bar/radial_painter.dart';

// ignore: must_be_immutable
class SquareProgressBar extends StatefulWidget {
  final double percentage; // 0.0 ... 1.0
  final Color solidBarColor;
  final Color emptyBarColor;
  final double strokeWidth;
  LinearGradient? gradientBarColor;
  final bool isAnimation;
  final int animationDuration;
  Widget? child;

  SquareProgressBar({
    Key? key,
    required this.percentage,
    this.solidBarColor = Colors.blue,
    this.emptyBarColor = Colors.grey,
    this.gradientBarColor,
    this.strokeWidth = 15,
    this.isAnimation = false,
    this.animationDuration = 2,
    this.child,
  }) : super(key: key);

  @override
  State<SquareProgressBar> createState() => _SquareProgressBarState();
}

class _SquareProgressBarState extends State<SquareProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.animationDuration),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: constraint.biggest.width,
          height: constraint.biggest.height,
          child: CustomPaint(
            painter: RadialPainter(
              animationController: animationController,
              progress: widget.percentage,
              isAnimation: widget.isAnimation,
              solidBarColor: widget.solidBarColor,
              emptyBarColor: widget.emptyBarColor,
              gradientBarColor: widget.gradientBarColor,
              strokeWidth: widget.strokeWidth,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
