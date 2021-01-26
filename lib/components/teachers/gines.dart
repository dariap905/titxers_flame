import 'package:flame/sprite.dart';
import 'package:flutter_langaw/teachers-game.dart';
import '../superclass/teacher.dart';

class Gines extends Teacher {

  Gines(TeachersGame game, double x, double y) : super(game, x, y) {
    movingSprite = List<Sprite>();
    tappedSprite = List<Sprite>();
    movingSprite.add(Sprite('teachers/dam/gines.png'));
    movingSprite.add(Sprite('teachers/dam/gines2.png'));
    tappedSprite.add(Sprite('teachers/dam/gines.png'));
    tappedSprite.add(Sprite('teachers/dam/gines2.png'));
  }
}