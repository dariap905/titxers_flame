import 'dart:ui';
import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
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
    createItems();
  }

  void createItems(){
    double x = (game.screenSize.width / 2  - (game.tileSize * 10) + (game.tileSize * 1.5));
    double y = game.screenSize.height / 2 - (game.tileSize * 4) + ((game.tileSize * 2) * 3);
    //cell 1, 0
    items.add(VisitTicket(game, x, y));
    //cell 1, 1
    items.add(VisitTicket(game, x + (game.tileSize * 4.5), y));
    //cell 1, 2
    items.add(VisitTicket(game, x + (game.tileSize * 9.5), y));
    //cell 1, 3
    items.add(VisitTicket(game, x + (game.tileSize * 14.2), y));
    //cell 2, 0
    items.add(VisitTicket(game, x, y + (game.tileSize * 5)));
    //cell 2, 1
    //cell 2, 2
    //cell 2, 3
    //cell 3, 0
    //cell 3, 1
    //cell 3, 2
    //cell 3, 3
  }

  void render(Canvas c) {
    shopInterfaceSprite.renderRect(c, shopInterfaceRect);
    items.forEach((Item item) => item.render(c));
  }

  void update(double t) {}

  void onTapDown() {
    items.forEach((Item item) {
        item.onTapDown();
    });
  }
}
