import 'package:flutter/material.dart';

class Effects extends StatelessWidget {
  const Effects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.red,
      child: const Center(child: Text('Effects')),
    );
  }
}