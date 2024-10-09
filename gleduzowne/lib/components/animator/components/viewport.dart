import 'package:flutter/material.dart';
import 'package:flame/game.dart';

class Viewport extends StatelessWidget {
  const Viewport({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GameWidget(
          game: MyGame(),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Column(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.rotate_left),
                onPressed: () {
                  // Handle rotation
                },
              ),
              IconButton(
                icon: const Icon(Icons.rotate_right),
                onPressed: () {
                  // Handle rotation
                },
              ),
              // Add more sidebar tools here
            ],
          ),
        ),
      ],
    );
  }
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // Load your game assets here
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // Render your game objects here
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update your game objects here
  }
}