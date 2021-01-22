
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'teachers-game.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  SharedPreferences storage = await SharedPreferences.getInstance();

  Flame.images.loadAll([
    'bg/dambg.png',
    'teachers/dam/carles.png',
    'teachers/dam/carles2.png',
    'teachers/dam/carles_tapped.png',
    'teachers/dam/carles_tapped2.png',
    'teachers/dam/carles_tapped2.png',
  ]);

  Flame.audio.disableLog();
  Flame.audio.loadAll([
    'bgm.mp3',
    'buy-item.mp3',
    'click-titxer.mp3',
    'close-click.mp3',
    'correct-answer.mp3',
    'loot-coin.mp3',
    'normal-click.mp3',
    'wrong-answer.mp3',
  ]);

  final game = TeachersGame(storage);
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);
}
