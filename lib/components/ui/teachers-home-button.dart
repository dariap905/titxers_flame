import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class TeachersHomeButton {
  final TeachersGame game;
  Rect rect;
  Sprite sprite;

  TeachersHomeButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width / 2 - (game.tileSize * 2),
      game.screenSize.height - (game.tileSize / 4) - (game.tileSize * 4),
      game.tileSize * 4,
      game.tileSize * 4,
    );
    sprite = Sprite('ui/teacher_sil.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    if(game.soundButton.isEnabled){
      Flame.audio.play('normal-click.mp3');
    }
    game.activeView = View.showTitxers;
  }
}