import 'dart:async';

import 'package:flame/game.dart';
import 'package:get_it/get_it.dart';
import 'package:matrix_game/player_box.dart';
import 'package:logging/logging.dart';

class MyGame extends FlameGame {
  final _logger = GetIt.instance<Logger>();
  bool _isJumping = false;
  late PlayerBox _player;

  @override
  Future<void> onLoad() async {
    // final bg = GameBackground();
    // await add(bg);
    _player = PlayerBox(position: Vector2(size.x / 4 - PlayerBox.posGap, size.y - 100), hitAction: () {});
    await add(_player);

    overlays.add('touchButton');

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

  Future<void> jump() async {
    if (_isJumping) return;

    _isJumping = true;

    // 점프
    for (int i = 1; i <= 50; i++) {
      _player.position = Vector2(_player.position.x, _player.position.y - 2);
      await Future.delayed(Duration(milliseconds: 10));
    }

    // 착지
    for (int i = 1; i <= 50; i++) {
      _player.position = Vector2(_player.position.x, _player.position.y + 2);
      await Future.delayed(Duration(milliseconds: 10));
    }

    _isJumping = false;
  }
}
