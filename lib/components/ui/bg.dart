import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';

class Dambg {

  final TeachersGame game;
  Sprite bgSprite;
  Rect bgRect;

  Dambg(this.game) {
    bgSprite = Sprite('bg/bg.png');
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 64),
      game.tileSize * 64,
      game.tileSize * 64,
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}