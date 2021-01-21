import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';

class B {

  final TeachersGame game;
  Sprite bSprite;
  Rect bRect;

  B(this.game) {
    bSprite = Sprite('ui/b.png');
    bRect = Rect.fromLTWH(
        game.screenSize.width / 2 - (game.tileSize * 3) + (game.tileSize * 9) - (game.tileSize*8.5),
        game.screenSize.height / 2 - (game.tileSize * 3) + (game.tileSize * 9),
        game.tileSize * 5,
        game.tileSize * 4.5);
  }

  void render(Canvas c) {
    bSprite.renderRect(c, bRect);
  }

  void update(double t) {

  }

  void onTapDown() {
  }
}