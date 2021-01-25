import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class VisitTicket extends Item {

  VisitTicket(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = (Sprite('items/visit_ticket.png'));
  }

  @override
  void onTapDown(){
    if(game.soundButton.isEnabled){
      Flame.audio.play('normal-click.mp3');
    }
    if(game.activeView == View.shop){
      //add (!isTapped)&  if you wanna make it unique
      if (game.gold >= 150) {
        isTapped = true;
        game.gold -= 150;
        game.spawnTeacher();
      }
    }
  }
}