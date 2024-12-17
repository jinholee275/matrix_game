import 'dart:async';

import 'package:flame/game.dart';
import 'package:matrix_game/player_box.dart';

class MyGame extends FlameGame {
  late PlayerBox _player;

  @override
  Future<void> onLoad() async {
    // final bg = GameBackground();
    // await add(bg);
    _player = PlayerBox(position: Vector2(size.x / 2 - PlayerBox.posGap, size.y - 100), hitAction: () {});
    await add(_player);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
  }
}
