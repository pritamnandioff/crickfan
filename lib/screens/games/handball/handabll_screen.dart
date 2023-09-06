import 'package:flutter/material.dart';

class HandBallScreen extends StatefulWidget {
  const HandBallScreen({super.key});

  @override
  State<HandBallScreen> createState() => _HandBallScreenState();
}

class _HandBallScreenState extends State<HandBallScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("handball"),
    );
  }
}
