import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_langaw/components/superclass/question.dart';
import '../teachers-game.dart';

class AnswerInterface{
  final TeachersGame game;
  Rect answerRect;
  Sprite answerSprite;
  Question question;

  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  String text = "Hello please work thanks";

  AnswerInterface(this.game) {
    answerRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 15,
    );

    answerSprite = Sprite('ui/answer_interface.png');

    painter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Colors.yellow,
      fontSize: 12,
    );

    position = Offset.zero;

  }

  void render(Canvas c) {
    answerSprite.renderRect(c, answerRect);
    painter.paint(c, position);
  }

  void update(double t) {
    // ignore: deprecated_member_use
    if ((painter.text?.text ?? '') != text) {
      painter.text = TextSpan(
        text: text,
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.tileSize * 6) - (painter.width / 2),
        (game.tileSize * 2) - (painter.height / 2),
      );
    }
  }
}