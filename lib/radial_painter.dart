import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final AnimationController animationController;
  late Animation<double> _animation;
  final double progress;
  double _barProgress = 0.0;
  final Color solidBarColor;
  final Color emptyBarColor;
  final LinearGradient? gradientBarColor;
  final double strokeWidth;
  final bool isAnimation;

  RadialPainter({
    required this.animationController,
    required this.progress,
    required this.solidBarColor,
    required this.emptyBarColor,
    required this.gradientBarColor,
    required this.strokeWidth,
    required this.isAnimation,
  }) : super(repaint: animationController);

  Paint paintEmptyBar() {
    final Paint paintBase = Paint()
      ..strokeWidth = strokeWidth
      ..color = emptyBarColor.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    return paintBase;
  }

  Path createEmptyBarBasePath(Size size) {
    final Path pathBase = Path();

    pathBase.moveTo(0, 0);
    pathBase.quadraticBezierTo(0, 0, size.width, 0);

    pathBase.moveTo(size.width, 0);
    pathBase.quadraticBezierTo(size.width, 0, size.width, size.height);

    pathBase.moveTo(size.width, size.height);
    pathBase.quadraticBezierTo(size.width, size.height, 0, size.height);

    pathBase.moveTo(0, size.height);
    pathBase.quadraticBezierTo(0, (size.height), 0, 0);

    return pathBase;
  }

  Paint paintBar(Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = solidBarColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    if (gradientBarColor != null) {
      final Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.width / 2),
        radius: size.width,
      );

      paint.shader = gradientBarColor!.createShader(rect);
    }

    return paint;
  }

  Path createBarPath(Size size, double progress) {
    final Path path = Path();

    if (progress >= 0.0 && progress <= 0.25) {
      var k = ((progress / 0.25) * 100) / 100;
      path.moveTo(0, 0);
      path.quadraticBezierTo(0, 0, size.width * k, 0);
    } else if (progress >= 0.25 && progress <= 0.5) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(0, 0, size.width, 0);

      var k = (((progress - 0.25) / 0.25) * 100) / 100;

      path.moveTo(size.width, 0);
      path.quadraticBezierTo(size.width, 0, size.width, size.height * k);
    } else if (progress >= 0.5 && progress <= 0.75) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(0, 0, size.width, 0);

      path.moveTo(size.width, 0);
      path.quadraticBezierTo(size.width, 0, size.width, size.height);

      var k = (((progress - 0.5) / 0.25) * 100) / 100;

      path.moveTo(size.width, size.height);
      path.quadraticBezierTo(
          size.width, size.height, size.width * (1 - k), size.height);
    } else if (progress >= 0.5 && progress <= 1) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(0, 0, size.width, 0);

      path.moveTo(size.width, 0);
      path.quadraticBezierTo(size.width, 0, size.width, size.height);

      path.moveTo(size.width, size.height);
      path.quadraticBezierTo(size.width, size.height, 0, size.height);

      var k = (((progress - 0.75) / 0.25) * 100) / 100;

      path.moveTo(0, size.height);
      path.quadraticBezierTo(0, size.height, 0, (size.height) * (1 - k));
    } else if (progress < 0) {
    } else if (progress > 1) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(0, 0, size.width, 0);

      path.moveTo(size.width, 0);
      path.quadraticBezierTo(size.width, 0, size.width, size.height);

      path.moveTo(size.width, size.height);
      path.quadraticBezierTo(size.width, size.height, 0, size.height);

      path.moveTo(0, size.height);
      path.quadraticBezierTo(0, (size.height), 0, 0);
    } else {
      debugPrint("Path Error");
    }

    return path;
  }

  void setBarProgress() {
    if (!isAnimation) {
      _barProgress = progress;
      return;
    }

    _animation = Tween(begin: 0.0, end: progress).animate(animationController)
      ..addListener(() {
        _barProgress = _animation.value;
      });
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint emptyBar = paintEmptyBar();
    final Path emptyBarPath = createEmptyBarBasePath(size);

    canvas.drawPath(emptyBarPath, emptyBar);

    setBarProgress();

    final Paint bar = paintBar(size);
    final Path barPath = createBarPath(size, _barProgress);

    canvas.drawPath(barPath, bar);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    animationController.reset();
    animationController.forward();
    return true;
  }
}
