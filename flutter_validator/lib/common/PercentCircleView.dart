import 'package:flutter/material.dart';
class PercentCircleView extends CustomPainter {
  final double percent;
  PercentCircleView(this.percent);
  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 20;
  @override
  void paint(Canvas canvas, Size size) {
//    _paint.shader = ui.Gradient.sweep(
//        Offset(size.width / 2, size.height / 2), [Colors.red, Colors.yellow]);
//    canvas.drawArc(
//        Rect.fromLTWH(0, 0, size.width, size.height), 0, pi*2, false, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}