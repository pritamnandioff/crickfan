import 'package:flutter/material.dart';

class BaseballScreen extends StatefulWidget {
  const BaseballScreen({super.key});

  @override
  State<BaseballScreen> createState() => _BaseballScreenState();
}

class _BaseballScreenState extends State<BaseballScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("BaseBall"),
    );
  }
}
