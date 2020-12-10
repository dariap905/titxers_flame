import 'dart:ui';
import 'package:flame/sprite.dart';
import '../teachers-game.dart';

class ShopInterfaceDisplay {
  final TeachersGame game;
  Rect shopInterfaceRect;
  Sprite shopInterfaceSprite;

  ShopInterfaceDisplay(this.game) {
    shopInterfaceRect = Rect.fromLTWH(
      game.tileSize * 2,
      game.tileSize/2,
      game.tileSize*3,
      game.tileSize*3,
    );
    shopInterfaceSprite = Sprite('ui/shop_interface.png');
  }

  void render(Canvas c) {
    shopInterfaceSprite.renderRect(c, shopInterfaceRect);
  }

  void update(double t) {

  }
}