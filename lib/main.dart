import 'package:custom_painter_training/clock/clock.dart';
import 'package:custom_painter_training/histogram/histogram.dart';
import 'package:custom_painter_training/liquid_header/liquid_header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Histogram()),
                );
              },
              child: Text('Histogram'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LiquidHeader()),
                );
              },
              child: Text('Liquid Header'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Clock()),
                );
              },
              child: Text('Clock'),
            ),
          ],
        ),
      ),
    );
  }
}
