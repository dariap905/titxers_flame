import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';

class MusicButton {
  final TeachersGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  MusicButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 0.25,
      game.tileSize * 4.5,
      game.tileSize * 4,
      game.tileSize * 4,
    );
    enabledSprite = Sprite('ui/sound/bgm_enabled.png');
    disabledSprite = Sprite('ui/sound/bgm_disabled.png');
  }

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, rect);
    } else {
      disabledSprite.renderRect(c, rect);
    }
  }

  void onTapDown() {
    if (isEnabled) {
      isEnabled = false;
      game.bgm.setVolume(0);
    } else {
      isEnabled = true;
      game.bgm.setVolume(1);
    }
  }
}