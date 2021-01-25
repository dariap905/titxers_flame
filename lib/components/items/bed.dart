import 'package:flame/sprite.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class Bed extends Item {

  Bed(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = (Sprite('items/bed.png'));
  }

  @override
  void onTapDown(){
  }
}