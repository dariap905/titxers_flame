import 'package:flame/sprite.dart';
import 'package:flutter_langaw/teachers-game.dart';
import '../superclass/teacher.dart';

class Pep extends Teacher {

  Pep(TeachersGame game, double x, double y) : super(game, x, y) {
    movingSprite = List<Sprite>();
    tappedSprite = List<Sprite>();
    movingSprite.add(Sprite('teachers/dam/pep.png'));
    movingSprite.add(Sprite('teachers/dam/pep2.png'));
    tappedSprite.add(Sprite('teachers/dam/pep.png'));
    tappedSprite.add(Sprite('teachers/dam/pep2.png'));
  }
}