import 'package:flutter/material.dart';

class Histogram extends StatelessWidget {
  const Histogram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          color: Colors.grey,
          child: CustomPaint(
            painter: BarCharPainter(),
          ),
        ),
      ),
    );
  }
}

class BarCharPainter extends CustomPainter {

  final List<double> data = [10, 50, 30, 90];

  final List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final barWidth = size.width / data.length;

    const double padding = 10.0;

    final maxDataValue = data.reduce((curr, next) => curr > next ? curr : next);

    for(int i = 0; i < data.length; i++) {

      paint.color = colors[i % colors.length];

      final barHeight = (data[i] / maxDataValue) * size.height;

      final left = (i * barWidth) + padding;

      final top = size.height - barHeight;

      final right = ((i + 1) * barWidth) - padding;

      final bottom = size.height;

      final rect = Rect.fromLTRB(left, top, right, bottom);

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
