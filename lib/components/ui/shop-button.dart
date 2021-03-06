import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';
import '../../view.dart';

class ShopButton {
  final TeachersGame game;
  Rect rect;
  Sprite sprite;

  ShopButton(this.game) {
    rect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 4.5),
      game.screenSize.height - (game.tileSize / 4 ) - (game.tileSize * 4),
      game.tileSize*4,
      game.tileSize*4,
    );
    sprite = Sprite('ui/shop_icon.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void onTapDown() {
    if(game.soundButton.isEnabled){
      Flame.audio.play('normal-click.mp3');
    }
    print("Tapped shop");
    game.activeView = View.shop;
  }
}