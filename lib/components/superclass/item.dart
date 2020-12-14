import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class Item extends SpriteComponent {
  final TeachersGame game;
  Rect itemRect;
  List<Sprite> itemSprite;

  bool isTapped = false;

  Item(this.game, double x, double y) {
    itemRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize * 2);
  }

  void render(Canvas c) {
  }

  void update(double t) {
  }

  void onTapDown() {
    if(game.activeView == View.shop){
      if (!isTapped) {
        isTapped = true;
        //todo
      }
    }
  }

}