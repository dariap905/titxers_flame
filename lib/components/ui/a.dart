import 'dart:ui';

import 'package:flame/sprite.dart';

import '../../teachers-game.dart';
import '../../view.dart';

class A {

  final TeachersGame game;
  Sprite aSprite;
  Rect aRect;

  A(this.game) {
    aSprite = Sprite('ui/a.png');
    aRect = Rect.fromLTWH(
        game.screenSize.width / 2 - (game.tileSize * 3) + (game.tileSize * 9) - (game.tileSize*13.5),
        game.screenSize.height / 2 - (game.tileSize * 3) + (game.tileSize * 9),
        game.tileSize * 5,
        game.tileSize * 4.5);
  }

  void render(Canvas c) {
    aSprite.renderRect(c, aRect);
  }

  void update(double t) {

  }

  void onTapDown() {
  }
}