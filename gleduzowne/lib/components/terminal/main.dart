import 'package:flutter/material.dart';

class Terminal extends StatelessWidget {
  const Terminal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.black,
      child: const Center(
        child: Text(
          'Terminal',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}