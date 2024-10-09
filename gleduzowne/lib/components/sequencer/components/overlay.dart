import 'package:flutter/material.dart';

class OverlayEditor extends StatelessWidget {
  const OverlayEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green,
      child: const Center(child: Text('Overlay Editor')),
    );
  }
}