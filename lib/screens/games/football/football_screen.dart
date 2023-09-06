import 'package:flutter/material.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({super.key});

  @override
  State<FootballScreen> createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Football"),
    );
  }
}
