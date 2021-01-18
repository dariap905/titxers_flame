import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../teachers-game.dart';

class AnswerInterface {
  final TeachersGame game;
  Rect answerRect;
  Sprite answerSprite;

  AnswerInterface(this.game) {
    answerRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 15,
    );
    answerSprite = Sprite('ui/answer_interface.png');
  }

  void render(Canvas c) {
    answerSprite.renderRect(c, answerRect);
  }

  void update(double t) {}

  void onTapDown() {
  }
}