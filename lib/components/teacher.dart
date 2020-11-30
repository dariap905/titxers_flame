import 'dart:ui';

import 'package:flame/sprite.dart';

import '../teachers-game.dart';
import '../view.dart';

class Teacher {
  final TeachersGame game;
  Rect teacherRect;
  List<Sprite> movingSprite;
  List<Sprite> tappedSprite;
  double movingSpriteIndex = 0;
  double tappedSpriteIndex = 0;

  double get speed => game.tileSize * 0.09;
  Offset targetLocation;

  bool isTapped = false;

  Teacher(this.game, double x, double y) {
    teacherRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    setTargetLocation();
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() *
        (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() *
        (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void render(Canvas c) {
    if (isTapped) {
      tappedSprite[tappedSpriteIndex.toInt()].renderRect(
          c, teacherRect.inflate(2));
      isTapped = false;
    } else {
      movingSprite[movingSpriteIndex.toInt()].renderRect(
          c, teacherRect.inflate(2));
    }
  }

  void update(double t) {
    movingSpriteIndex += 4 * t;
    if (movingSpriteIndex >= 2) {
      movingSpriteIndex -= 2;
    }

    double stepDistance = speed * t;
    Offset toTarget = targetLocation -
        Offset(teacherRect.left, teacherRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(
          toTarget.direction, stepDistance);
      teacherRect = teacherRect.shift(stepToTarget);
    } else {
      teacherRect = teacherRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void onTapDown() {
    if (!isTapped) {
      isTapped = true;

      if (game.activeView == View.home) {
        game.gold += 1;
      }
    }
  }
}