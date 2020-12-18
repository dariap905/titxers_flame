import 'package:flame/sprite.dart';
import 'package:flutter_langaw/teachers-game.dart';
import '../../view.dart';
import '../superclass/teacher.dart';

class Carles extends Teacher {

  Carles(TeachersGame game, double x, double y) : super(game, x, y) {
    movingSprite = List<Sprite>();
    tappedSprite = List<Sprite>();
    movingSprite.add(Sprite('teachers/dam/carles.png'));
    movingSprite.add(Sprite('teachers/dam/carles2.png'));
    tappedSprite.add(Sprite('teachers/dam/carles_tapped.png'));
    tappedSprite.add(Sprite('teachers/dam/carles_tapped2.png'));
  }

  @override
  void onTapDown() {
    if(game.activeView == View.playing){
      if (!isTapped) {
        isTapped = true;
        game.spawnGoldCoins(this.x, this.y);
      }
    }
  }

}