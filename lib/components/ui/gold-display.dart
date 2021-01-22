import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../teachers-game.dart';

/*this is just to display the text of how much gold the player currently has*/

class GoldDisplay {
  final TeachersGame game;
  Rect goldRect;
  Sprite goldSprite;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

    GoldDisplay(this.game) {
      goldRect = Rect.fromLTWH(
        game.tileSize * .25,
        game.tileSize/4,
        game.tileSize*4,
        game.tileSize*4,
      );

      goldSprite = Sprite('ui/gold_coin.png');

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
    goldSprite.renderRect(c, goldRect);
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
        (game.tileSize * 7) - (painter.width / 2),
        (game.tileSize * 2) - (painter.height / 2),
      );
    }
  }
}