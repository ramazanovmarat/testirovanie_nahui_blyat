import 'package:flutter/material.dart';

class LiquidHeader extends StatelessWidget {
  const LiquidHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: CustomPaint(
              painter: HeaderWavePainter(),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Профиль пользователя",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    paint.shader = LinearGradient(
      colors: [Colors.purple, Colors.blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(rect);

    paint.style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);

    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2,
      size.width,
      size.width * 0.8,
    );

    path.lineTo(size.width, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}