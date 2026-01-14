import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  // Чтобы часы шли, нам нужно обновлять экран каждую секунду.
  // Timer будет вызывать setState.
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Темный фон для контраста
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = size.width / 2;

    final paintCircle = Paint()..color = Colors.white;

    canvas.drawCircle(center, radius, paintCircle);

    final paintRim = Paint()
      ..color = Colors.blue[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(center, radius, paintRim);

    canvas.translate(centerX, centerY);

    final paintTick = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double tickAngle = 2 * pi / 60;

    canvas.save();

    for(int i = 0; i < 60; i++) {
      bool isHourTick = i % 5 == 0;
      paintTick.strokeWidth = isHourTick ? 4 : 1;
      double tickLength = isHourTick ? 15 : 8;
      canvas.drawLine(
        Offset(0, -radius + 10),
        Offset(0, -radius + 10 + tickLength),
        paintTick,
      );
      canvas.rotate(tickAngle);
    }

    canvas.restore();

    final now = DateTime.now();

    final hourAngle = (now.hour % 12 + now.minute / 60) * (2 * pi / 12);

    drawHand(canvas, hourAngle, radius * 0.5, 6, Colors.black);

    double minuteAngle = now.minute * (2 * pi / 60);
    
    drawHand(canvas, minuteAngle, radius * 0.7, 4, Colors.red);

    double secondAngle = now.second * (2 * pi / 60);
    
    drawHand(canvas, secondAngle, radius * 0.8, 2, Colors.red);

    canvas.drawCircle(Offset.zero, 4, Paint()..color = Colors.red);
  }

  void drawHand(Canvas canvas, double angle, double length, double width, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    canvas.save();

    canvas.rotate(angle);

    canvas.drawLine(Offset.zero, Offset(0, -length), paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

