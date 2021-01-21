import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';

class C {

  final TeachersGame game;
  Sprite cSprite;
  Rect cRect;

  C(this.game) {
    cSprite = Sprite('ui/c.png');
    cRect = Rect.fromLTWH(
        game.screenSize.width / 2 - (game.tileSize * 3) + (game.tileSize * 9) - (game.tileSize*3.5),
        game.screenSize.height / 2 - (game.tileSize * 3) + (game.tileSize * 9),
        game.tileSize * 5,
        game.tileSize * 4.5);
  }

  void render(Canvas c) {
    cSprite.renderRect(c, cRect);
  }

  void update(double t) {

  }

  void onTapDown() {
  }
}