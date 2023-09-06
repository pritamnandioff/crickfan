import 'package:flutter/material.dart';

class Mycontests extends StatefulWidget {
  const Mycontests({super.key});

  @override
  State<Mycontests> createState() => _MycontestsState();
}

class _MycontestsState extends State<Mycontests> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/waiting.png"),
      ],
    );
  }
}
