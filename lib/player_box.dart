import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerBox extends PositionComponent with HasGameRef, CollisionCallbacks {
  static const playerSize = 60.0;

  final Function hitAction;
  late ShapeHitbox hitbox;

  PlayerBox({required Vector2 position, required this.hitAction}) : super(size: Vector2.all(playerSize), position: position);
  
  static double get posGap => playerSize / 2;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    [
      (
        playerSize - 10,
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10
      ),
      (
        playerSize / 5 * 2,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.fill
      ),
    ]
        .map((shape) => RectangleComponent(
              size: Vector2(shape.$1, shape.$1),
              paint: shape.$2,
              position: Vector2(-shape.$1 / 2 + posGap, -shape.$1 / 2 + posGap),
            ))
        .forEach((e) => add(e));

    final hitPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    hitbox = RectangleHitbox()
      ..paint = hitPaint
      ..renderShape = kDebugMode;
    add(hitbox);
  }
}
