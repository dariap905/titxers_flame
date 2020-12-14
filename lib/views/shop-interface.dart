import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter_langaw/components/items/visit-ticket.dart';
import 'package:flutter_langaw/components/superclass/item.dart';
import '../teachers-game.dart';

class ShopInterface {
  final TeachersGame game;
  Rect shopInterfaceRect;
  Sprite shopInterfaceSprite;

  List<Item> items;

  ShopInterface(this.game) {
    shopInterfaceRect = Rect.fromLTWH(
      game.screenSize.width / 2  - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 20,
    );
    shopInterfaceSprite = Sprite('ui/shop_interface.png');

    items = List<Item>();
  }

  void createItems(){
    double x = (game.screenSize.width / 2  - (game.tileSize * 10) - (game.tileSize * 2));
    double y = game.screenSize.height / 2 - (game.tileSize * 4) - (game.tileSize * 2);
    items.add(VisitTicket(game, x, y));
  }

  void render(Canvas c) {
    shopInterfaceSprite.renderRect(c, shopInterfaceRect);
    items.forEach((Item item) => item.render(c));
  }

  void update(double t) {}
}
