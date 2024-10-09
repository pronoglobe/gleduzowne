import 'package:flutter/material.dart';

class ProjectMonitor extends StatelessWidget {
  const ProjectMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.cyan,
      child: const Center(child: Text('Project Monitor')),
    );
  }
}