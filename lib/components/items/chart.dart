import 'package:flame/sprite.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class Chart extends Item {

  Chart(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = (Sprite('items/chart.png'));
  }

  @override
  void onTapDown(){
  }
}