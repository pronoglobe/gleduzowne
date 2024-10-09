import 'package:flutter/material.dart';

class RedoUndoHistory extends StatelessWidget {
  const RedoUndoHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.brown,
      child: const Center(child: Text('Redo and Undo History')),
    );
  }
}