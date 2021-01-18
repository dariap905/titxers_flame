import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../../view.dart';
import '../superclass/item.dart';
import '../../teachers-game.dart';

class VisitTicket extends Item {

  VisitTicket(TeachersGame game, double x, double y) : super(game, x, y) {
    itemSprite = List<Sprite>();
    itemSprite.add(Sprite('items/visit_ticket.png'));
  }

  @override
  void onTapDown(){
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