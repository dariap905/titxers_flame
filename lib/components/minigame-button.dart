import 'dart:ui';
import 'package:flame/sprite.dart';
import '../teachers-game.dart';
import '../view.dart';

class MinigameButton {
  final TeachersGame game;
  Rect rect;
  Sprite sprite;

  MinigameButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('ui/minigame_icon.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.help;
  }
}