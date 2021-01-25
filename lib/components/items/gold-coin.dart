import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import '../../teachers-game.dart';
import '../../view.dart';
import '../superclass/teacher.dart';

class GoldCoin {
  final TeachersGame game;
  Teacher teacherPosition;
  Rect goldCoinRect;
  Sprite goldCoin;
  bool isTapped = false;
  Offset targetLocation;

  GoldCoin(this.game, double x, double y) {
    goldCoinRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
    goldCoin = Sprite('ui/gold_coin.png');
  }

  void render(Canvas c) {
    goldCoin.renderRect(c, goldCoinRect);
  }

  void onTapDown() {
      if (game.activeView == View.playing) {
        Flame.audio.play('loot-coin.mp3');
        isTapped = true;
        game.gold += 1;
      }
  }
}