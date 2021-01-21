import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../teachers-game.dart';
import '../view.dart';

class ChooseQuestionField {
  final TeachersGame game;
  Rect questionsRect;
  //Rect ag, cm, ic, co;
  Sprite questionsSprite;

  ChooseQuestionField(this.game) {
    questionsRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 10,
    );

    questionsSprite = Sprite('ui/choose_questions.png');
  }

  void render(Canvas c) {
    questionsSprite.renderRect(c, questionsRect);
  }

  void update(double t) {}

  void onTapDown() {
    print("Tapped answer a question");
    game.activeView = View.answers;
  }
}