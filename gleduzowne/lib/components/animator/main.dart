import 'package:flutter/material.dart';
import 'package:flame/game.dart';
// import 'package:gleduzowne/components/viewport.dart';
import 'package:gleduzowne/components/animator/components/viewport.dart' as Viewport;

class VideoEditorPane extends StatefulWidget {
  const VideoEditorPane({super.key});

  @override
  _VideoEditorPaneState createState() => _VideoEditorPaneState();
}

class _VideoEditorPaneState extends State<VideoEditorPane> {
  int _selectedPaneIndex = 0;

  void _onPaneSelected(int index) {
    setState(() {
      _selectedPaneIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ToggleButtons(
          children: const <Widget>[
            Icon(Icons.edit),
            Icon(Icons.animation),
          ],
          isSelected: [_selectedPaneIndex == 0, _selectedPaneIndex == 1],
          onPressed: _onPaneSelected,
        ),
        Expanded(
          child: _selectedPaneIndex == 0 ? const EditorPane() : const AnimatorPane(),
        ),
      ],
    );
  }
}

class EditorPane extends StatelessWidget {
  const EditorPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Add your editor-specific toggles and buttons here
        const Text('Editor Pane Controls'),
        Expanded(
          child: Viewport.Viewport(),
        ),
      ],
    );
  }
}

class AnimatorPane extends StatelessWidget {
  const AnimatorPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Add your animator-specific toggles and buttons here
        const Text('Animator Pane Controls'),
        Expanded(
          child: Viewport.Viewport(),
        ),
      ],
    );
  }
}