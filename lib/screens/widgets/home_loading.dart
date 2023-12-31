import 'package:flutter/material.dart';

class HomeLoading extends StatefulWidget {
  const HomeLoading({super.key});

  @override
  State<HomeLoading> createState() => _HomeLoadingState();
}

class _HomeLoadingState extends State<HomeLoading> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
