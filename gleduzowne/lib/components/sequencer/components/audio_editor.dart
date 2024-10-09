import 'package:flutter/material.dart';

class AudioEditor extends StatelessWidget {
  const AudioEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.orange,
      child: const Center(child: Text('Audio Editor')),
    );
  }
}