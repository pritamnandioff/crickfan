import 'package:flutter/material.dart';

class BasketBallScreen extends StatefulWidget {
  const BasketBallScreen({super.key});

  @override
  State<BasketBallScreen> createState() => _BasketBallScreenState();
}

class _BasketBallScreenState extends State<BasketBallScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("BasketBall"),
    );
  }
}
