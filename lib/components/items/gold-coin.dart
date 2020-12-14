import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../teachers-game.dart';

//around the teacher that has been tapped

class GoldCoin {
  final TeachersGame game;
  Rect goldCoinRect;
  List<Sprite> goldCoinSprite;
  double goldCoinSpriteIndex = 0;

  GoldCoin(this.game, double x, double y) {
    goldCoinRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    goldCoinSprite.add(Sprite('ui/gold_coin.png'));
  }

  void render(Canvas c) {
    goldCoinSprite[goldCoinSpriteIndex.toInt()].renderRect(
        c, goldCoinRect.inflate(2));
  }

  void update(double t) {
    }

  }