import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

/// This class encapulates the whole game.
class DrawText extends FlameGame {
  TextComponent? text;
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    TextStyle defaultTextStyle =
        const TextStyle(fontSize: 10, color: Colors.white);
    text = TextComponent(textRenderer: TextPaint(style: defaultTextStyle))
      ..position = Vector2(50, 50)
      ..text = 'TEXT';
    add(text!);
    text?.text = 'TEXT2';
  }

}
