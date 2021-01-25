import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_langaw/components/items/coffee.dart';
import 'package:flutter_langaw/components/items/laptop.dart';
import 'package:flutter_langaw/components/items/bed.dart';
import 'package:flutter_langaw/components/items/chart.dart';
import 'package:flutter_langaw/components/items/visit-ticket.dart';
import 'package:flutter_langaw/components/superclass/item.dart';
import '../teachers-game.dart';
import '../view.dart';

class ShopInterface {
  final TeachersGame game;
  Rect shopInterfaceRect;
  Sprite shopInterfaceSprite;

  //one list for rendering
  List<Item> itemsRenderOnly;

  //one list for one-time use items

  //one list for multiple use items

  ShopInterface(this.game) {
    shopInterfaceRect = Rect.fromLTWH(
      game.screenSize.width / 2 - (game.tileSize * 10),
      game.screenSize.height / 2 - (game.tileSize * 4),
      game.tileSize * 20,
      game.tileSize * 20,
    );
    shopInterfaceSprite = Sprite('ui/shop_interface.png');

    itemsRenderOnly = List<Item>();
    createItemsForDisplay();
  }

  void createItemsForDisplay() {
    double x = (game.screenSize.width / 2 - (game.tileSize * 10) +
        (game.tileSize * 1.5));
    double y = game.screenSize.height / 2 - (game.tileSize * 4) +
        ((game.tileSize * 2) * 3);
    //cell 1, 0
    itemsRenderOnly.add(VisitTicket(game, x, y));
    //cell 1, 1
    itemsRenderOnly.add(Bed(game, x+game.tileSize*4.5, y));
    //cell 1, 2
    itemsRenderOnly.add(Chart(game, x+game.tileSize*9.5, y));
    //cell 1, 3
    itemsRenderOnly.add(Coffee(game, x+game.tileSize*14.5, y));
    //cell 2, 0
    itemsRenderOnly.add(Laptop(game, x, y+game.tileSize*4.5));
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
    itemsRenderOnly.forEach((Item item) => item.render(c));
  }

  void update(double t) {}

  void onTapDown(TapDownDetails d) {
    if (game.activeView == View.shop) {
      itemsRenderOnly.forEach((Item item) {
        if (item.itemRect.contains(d.globalPosition)) {
          item.onTapDown();
        }
      }
      );
    }
  }
}
