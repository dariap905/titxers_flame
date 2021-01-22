import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class MinigameButton {
  final TeachersGame game;
  Rect minigameRect;
  Sprite sprite;

  MinigameButton(this.game) {
    minigameRect = Rect.fromLTWH(
      game.tileSize * 0.25,
      game.screenSize.height - (game.tileSize / 4) - (game.tileSize * 4),
      game.tileSize * 4,
      game.tileSize * 4,
    );
    sprite = Sprite('ui/minigame_icon.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, minigameRect);
  }

  void onTapDown() {
    Flame.audio.play('normal-click.mp3');
    print("Tapped minigame");
    game.activeView = View.questions;
  }
}