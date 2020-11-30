import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../teachers-game.dart';

class GoldDisplay {
  final TeachersGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

    GoldDisplay(this.game) {
      painter = TextPainter(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );

      textStyle = TextStyle(
        color: Colors.yellow,
        fontSize: 40,
        shadows: <Shadow>[
          Shadow(
            blurRadius: 7,
            color: Color(0xff000000),
            offset: Offset(3, 3),
          ),
        ],
      );
      position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    // ignore: deprecated_member_use
    if ((painter.text?.text ?? '') != game.gold.toString()) {
      painter.text = TextSpan(
        text: game.gold.toString(),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.tileSize * 2.5) - (painter.width / 2),
        (game.tileSize) - (painter.height / 2),
      );
    }
  }
}