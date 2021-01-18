import 'dart:ui';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_langaw/components/items/visit-ticket.dart';
import 'package:flutter_langaw/components/superclass/item.dart';
import '../teachers-game.dart';

class QuestionsInterface {
  final TeachersGame game;
  Rect shopInterfaceRect;
  Sprite shopInterfaceSprite;

  QuestionsInterface(this.game) {
    shopInterfaceRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 20,
    );
    shopInterfaceSprite = Sprite('ui/choose_questions.png');
  }

  void render(Canvas c) {
    shopInterfaceSprite.renderRect(c, shopInterfaceRect);
  }

  void update(double t) {}

  void onTapDown() {
  }
}