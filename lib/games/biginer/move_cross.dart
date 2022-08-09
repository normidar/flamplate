import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

/// This class encapulates the whole game.
class MoveCross extends FlameGame {
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    add(AimCross()..position = Vector2(150, 50));
  }
}

class AimCross extends PositionComponent {
  AimCross();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    autoMove();
  }

  void autoMove() {
    move();
    Future.delayed(const Duration(seconds: 1), autoMove);
  }

  

  var isLeft = true;
  void move() {
    isLeft = !isLeft;
    position.add(Vector2(isLeft?50:-50, 0));
  }

  final Paint _paint = Paint();
  @override
  void render(Canvas canvas) {
    _paint.color = Colors.red;
    _paint.strokeWidth = 1.8;
    const double length = 5;
    canvas.drawLine(Offset.zero, const Offset(-length, 0), _paint);
    canvas.drawLine(Offset.zero, const Offset(0, -length), _paint);
    canvas.drawLine(Offset.zero, const Offset(length, 0), _paint);
    canvas.drawLine(Offset.zero, const Offset(0, length), _paint);
  }
}
