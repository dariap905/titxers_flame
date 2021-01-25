import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class Item extends SpriteComponent {
  final TeachersGame game;
  Rect itemRect;
  Sprite itemSprite;
  double itemSpriteIndex = 0;

  bool isTapped = false;

  Item(this.game, double x, double y) {
    itemRect = Rect.fromLTWH(x, y, game.tileSize * 3, game.tileSize * 3);
  }

  void render(Canvas c) {
    itemSprite.renderRect(c, itemRect);
  }

  void update(double t) {
  }

  void onTapDown() {
  }

}