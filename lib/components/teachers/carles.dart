import 'package:flame/sprite.dart';
import 'package:flutter_langaw/teachers-game.dart';
import '../teacher.dart';

class Carles extends Teacher {
  Carles(TeachersGame game, double x, double y) : super(game, x, y) {
    movingSprite = List<Sprite>();
    tappedSprite = List<Sprite>();
    movingSprite.add(Sprite('teachers/dam/carles.png'));
    movingSprite.add(Sprite('teachers/dam/carles2.png'));
    tappedSprite.add(Sprite('teachers/dam/carles_tapped.png'));
    tappedSprite.add(Sprite('teachers/dam/carles_tapped2.png'));
  }
}