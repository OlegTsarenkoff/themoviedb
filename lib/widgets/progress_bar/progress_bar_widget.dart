import 'dart:math';

import 'package:flutter/material.dart';
import 'package:themoviedb/theme/colors.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({Key? key}) : super(key: key);

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColorApp,
      child: const Center(
          child: SizedBox(
        width: 100,
        height: 100,
        child: RadialPercentWidget(
          percent: 0.58,
          fillColor: ProgressBarColors.fillColor,
          lineColor: ProgressBarColors.greenLineColor,
          baseLineColor: ProgressBarColors.greenBaseColor,
          lineWidth: 5,
          child: Text(
            '58%',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.backgroundColorApp,
            ),
          ),
        ),
      )),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color baseLineColor;
  final double lineWidth;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.baseLineColor,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          lineColor: lineColor,
          baseLineColor: baseLineColor,
          lineWidth: lineWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Center(child: child),
        ));
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color baseLineColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.baseLineColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawLine(canvas, arcRect);
    drawBaseLine(canvas, arcRect);
  }

  void drawLine(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = lineWidth;

    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawBaseLine(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = baseLineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;

    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 4;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
