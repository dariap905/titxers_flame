import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../teachers-game.dart';

class EcaibDisplay {
  final TeachersGame game;
  Rect ecaibRect;
  Sprite ecaibSprite;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  EcaibDisplay(this.game) {

    ecaibRect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 0.25) - game.tileSize*4,
      game.tileSize/4,
      game.tileSize * 4,
      game.tileSize * 4,
    );
    ecaibSprite = Sprite('ui/ecaib_coin.png');

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
    ecaibSprite.renderRect(c, ecaibRect);
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
        (game.screenSize.width - (game.tileSize * 0.25) - game.tileSize * 4) - (painter.width * 2),
        (game.tileSize * 2) - (painter.height / 2),
      );
    }
  }
}