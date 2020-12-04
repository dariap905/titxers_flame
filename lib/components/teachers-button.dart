import 'dart:ui';
import 'package:flame/sprite.dart';
import '../teachers-game.dart';
import '../view.dart';

class TeachersHomeButton {
  final TeachersGame game;
  Rect rect;
  Sprite sprite;

  TeachersHomeButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width / 2 - (game.tileSize / 2),
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
    sprite = Sprite('ui/teacher_sil.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    game.activeView = View.credits;
  }
}