import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flamplate/games/biginer/base_sprite/dragable_sprite.dart';
import 'package:flamplate/games/biginer/base_sprite/tappable_sprite.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setPortrait();
  await Flame.device.fullScreen();

  // final game = DrawCross();
  // final game = MoveCross();
  // final game = RotateCross();
  // final game = BaseAnime();
  // final game = TappableSprite();
  final game = DragableSprite();

  runApp(GameWidget(game: game));
}
