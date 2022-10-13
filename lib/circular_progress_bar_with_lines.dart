library circular_progress_bar_with_lines;

import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressBarWithLines extends StatelessWidget {
  final double linesLength;
  final double radius;
  final double percent;
  final int linesAmount;
  final double linesWidth;
  final Color linesColor;
  final Widget Function(BuildContext)? centerWidgetBuilder;

  const CircularProgressBarWithLines({
    Key? key,
    this.linesLength = 50,
    this.radius = 100,
    required this.percent,
    this.linesAmount = 60,
    this.linesWidth = 2,
    this.centerWidgetBuilder,
    this.linesColor = Colors.black,
  })  : assert(percent >= 0 && percent <= 100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ProgressBarPainter(
        linesLength: linesLength,
        radius: radius,
        percent: percent,
        linesAmount: linesAmount,
        linesWidth: linesWidth,
        linesColor: linesColor,
      ),
      child: Center(
        child: centerWidgetBuilder != null
            ? Builder(
                builder: centerWidgetBuilder!,
              )
            : Container(),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double linesLength;
  final double radius;
  final double percent;
  final int linesAmount;
  final double linesWidth;
  final Color linesColor;

  late final Paint _paint;

  _ProgressBarPainter({
    required this.linesLength,
    required this.radius,
    required this.percent,
    required this.linesAmount,
    required this.linesWidth,
    required this.linesColor,
  }) {
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = linesWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radiantStep = 2 * pi / linesAmount;
    final int showedLines = (percent / 100 * linesAmount).round();

    for (int i = 0; i < linesAmount; i++) {
      if (i >= showedLines) {
        _paint.color = linesColor.withOpacity(0);
      } else {
        _paint.color = linesColor;
      }

      canvas.drawLine(
        Offset(
          centerX + sin(i * radiantStep) * radius,
          centerY + -cos(i * radiantStep) * radius,
        ),
        Offset(
          centerX + sin(i * radiantStep) * (radius + linesLength),
          centerY + -cos(i * radiantStep) * (radius + linesLength),
        ),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
