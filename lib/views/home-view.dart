import 'dart:ui';
import 'package:flame/sprite.dart';
import '../teachers-game.dart';

class HomeView {
  final TeachersGame game;
  Rect goldRect;
  Sprite goldSprite;
  Rect ecaibRect;
  Sprite ecaibSprite;

  HomeView(this.game) {
    goldRect = Rect.fromLTWH(
      game.tileSize * .25,
      game.tileSize/4,
      game.tileSize*1.2,
      game.tileSize*1.2,
    );
    goldSprite = Sprite('ui/gold_coin.png');

    ecaibRect = Rect.fromLTWH(
      game.screenSize.width - (game.tileSize * 1.25),
      game.tileSize/4,
      game.tileSize * 1.2,
      game.tileSize * 1.2,
    );
    ecaibSprite = Sprite('ui/ecaib_coin.png');
  }

  void render(Canvas c) {
    goldSprite.renderRect(c, goldRect);
    ecaibSprite.renderRect(c, ecaibRect);
  }

  void update(double t) {}
}