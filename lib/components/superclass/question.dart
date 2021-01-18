import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../../teachers-game.dart';

class Questions{
  final TeachersGame game;
  //json info
  String text;
  String validAnswer;

  Rect qRect;
  Sprite qSprite;

  Questions(this.game) {
    qRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 10,
    );
    //qSprite = Sprite('ui/choose_questions.png');
  }

  void render(Canvas c) {
    qSprite.renderRect(c, qRect);
  }

  void update(double t) {}

  void onTapDown() {

  }
}