import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:matrix_game/my_game.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: MyGame(),
      overlayBuilderMap: {
        'touchButton': (BuildContext context, MyGame game) {
          return Align(
            alignment: Alignment.center,
            child: Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (event) => game.jump(),
              child: SizedBox(
                width: game.size.x,
                height: game.size.y,
              ),
            ),
          );
        },
      },
    );
  }
}
