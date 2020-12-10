import 'dart:ui';

import 'package:flame/sprite.dart';

import '../../teachers-game.dart';
import '../../view.dart';
import '../teacher.dart';

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
    goldCoinRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    coinSprite.add(Sprite('ui/gold_coin.png'));
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    coinSprite[coinSpriteIndex.toInt()].renderRect(c, goldCoinRect.inflate(2));
    //coing.renderRect(c, goldCoinRect);
  }

  void update(double t) {
  }

  void onTapDown() {
      if (game.activeView == View.playing) {
        isTapped = true;
        game.gold += 1;
      }
  }
}