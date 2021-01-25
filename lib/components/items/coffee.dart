import 'package:flame/sprite.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class Coffee extends Item {

  Coffee(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = (Sprite('items/coffee_cup.png'));
  }

  @override
  void onTapDown(){
  }
}