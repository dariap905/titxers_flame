import 'dart:ui';

import 'package:flame/sprite.dart';

import '../../teachers-game.dart';
import '../../view.dart';

class CloseIcon {

  final TeachersGame game;
  Sprite ciSprite;
  Rect ciRect;

  CloseIcon(this.game) {
    ciSprite = Sprite('ui/close_icon.png');
    ciRect = Rect.fromLTWH(
        game.screenSize.width / 2 - (game.tileSize * 3) + (game.tileSize * 9),
        game.screenSize.height / 2 - (game.tileSize * 3) ,
        game.tileSize * 3,
        game.tileSize * 3);
  }

  void render(Canvas c) {
    ciSprite.renderRect(c, ciRect);
  }

  void update(double t) {

  }

  void onTapDown() {
    game.activeView = View.playing;
  }
}