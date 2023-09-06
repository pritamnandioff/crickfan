import 'package:flutter/material.dart';

class HockeyScreen extends StatefulWidget {
  const HockeyScreen({super.key});

  @override
  State<HockeyScreen> createState() => _HockeyScreenState();
}

class _HockeyScreenState extends State<HockeyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Hockey"),
    );
  }
}
