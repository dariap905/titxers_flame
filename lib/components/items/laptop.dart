import 'package:flame/sprite.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class Laptop extends Item {

  Laptop(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = (Sprite('items/laptop.png'));
  }

  @override
  void onTapDown(){
  }
}