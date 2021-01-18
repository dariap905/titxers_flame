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
        game.screenSize.width / 2 - (game.tileSize * 3) + (game.tileSize * 9),
        game.screenSize.height / 2 - (game.tileSize * 3) ,
        game.tileSize,
        game.tileSize);
  }

  void render(Canvas c) {
    aSprite.renderRect(c, aRect);
  }

  void update(double t) {

  }

  void onTapDown() {
  }
}