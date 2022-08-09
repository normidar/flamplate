import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flamplate/games/biginer/draw_cross.dart';
import 'package:flamplate/games/biginer/move_cross.dart';
import 'package:flamplate/games/biginer/rotate_cross.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setPortrait();
  await Flame.device.fullScreen();

  // final game = DrawCross();
  // final game = MoveCross();
  final game = RotateCross();

  runApp(GameWidget(game: game));
}

