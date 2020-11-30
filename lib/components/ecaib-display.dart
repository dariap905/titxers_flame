import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../teachers-game.dart';

class EcaibDisplay {
  final TeachersGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  EcaibDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Colors.white,
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
    if ((painter.text?.text ?? '') != game.ecaibs.toString()) {
      painter.text = TextSpan(
        text: game.ecaibs.toString(),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.tileSize * 6.5) - (painter.width / 2),
        (game.tileSize) - (painter.height / 2),
      );
    }
  }
}