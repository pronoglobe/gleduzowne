import 'package:flutter/material.dart';
import 'package:gleduzowne/components/sequencer/components/timeline.dart';
import 'package:gleduzowne/components/sequencer/components/video_player.dart';
import 'package:gleduzowne/components/sequencer/components/overlay.dart';
import 'package:gleduzowne/components/sequencer/components/audio_editor.dart';
import 'package:gleduzowne/components/sequencer/components/compositions.dart';
import 'package:gleduzowne/components/sequencer/components/effects.dart';
import 'package:gleduzowne/components/sequencer/components/clip_properties.dart';
import 'package:gleduzowne/components/sequencer/components/redo_undo_history.dart';
import 'package:gleduzowne/components/sequencer/components/project_monitor.dart';
import 'package:gleduzowne/components/sequencer/components/sequences.dart';

class VideoEditorPane extends StatelessWidget {
  const VideoEditorPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Project Monitor
        const ProjectMonitor(),
        // Timeline
        const Timeline(),
        // Video Editor
        // const VideoPlayer(),
        // Overlay
        const OverlayEditor(),
        // Audio Editor
        const AudioEditor(),
        // Compositions
        const Compositions(),
        // Effects
        const Effects(),
        // Clip Properties
        const ClipProperties(),
        // Redo and Undo History
        const RedoUndoHistory(),
        // Sequences
        const Sequences(),
      ],
    );
  }
}