import 'package:flutter/material.dart';

class ClipProperties extends StatelessWidget {
  const ClipProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.yellow,
      child: const Center(child: Text('Clip Properties')),
    );
  }
}