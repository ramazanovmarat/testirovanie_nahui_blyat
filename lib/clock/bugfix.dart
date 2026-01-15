import 'package:flutter/material.dart';

class Bugfix extends StatefulWidget {
  const Bugfix({super.key});

  @override
  State<Bugfix> createState() => _BugfixState();
}

class _BugfixState extends State<Bugfix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Profile'),
        ],
      ),
    );
  }
}
