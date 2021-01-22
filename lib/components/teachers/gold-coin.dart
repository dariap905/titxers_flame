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
  List<Sprite> coinSprite;
  Sprite coing;
  double coinSpriteIndex = 0;
  bool isTapped = false;
  double get speed => game.tileSize * 0.09;
  Offset targetLocation;

  GoldCoin(this.game, double x, double y) {
    coinSprite = List<Sprite>();
    goldCoinRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
    coinSprite.add(Sprite('ui/gold_coin.png'));
    setTargetLocation();
  }

  void setTargetLocation() {
/*    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 4));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 50));
    targetLocation = Offset(x, y);*/
  }

  void render(Canvas c) {
    coinSprite[coinSpriteIndex.toInt()].renderRect(c, goldCoinRect.inflate(2));
    //coing.renderRect(c, goldCoinRect);
  }

  void update(double t) {
  }

  void onTapDown() {
      if (game.activeView == View.playing) {
        Flame.audio.play('loot-coin.mp3');
        isTapped = true;
        game.gold += 1;
      }
  }
}