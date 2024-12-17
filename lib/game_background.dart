import 'dart:async';

import 'package:flame/components.dart';

class GameBackground extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    // sprite = await gameRef.loadSprite('your_background_image.jpg');
    // size = Vector2(gameRef.size.x, gameRef.size.y);
  }
}