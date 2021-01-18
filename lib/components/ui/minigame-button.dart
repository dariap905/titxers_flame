import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class MinigameButton {
  final TeachersGame game;
  Rect rect;
  Sprite sprite;

  MinigameButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 0.25,
      game.screenSize.height - (game.tileSize / 4) - (game.tileSize * 4),
      game.tileSize * 4,
      game.tileSize * 4,
    );
    sprite = Sprite('ui/minigame_icon.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    debugPrint("Taptap");
    game.activeView = View.questions;
  }
}