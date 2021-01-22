import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../teachers-game.dart';

class SoundButton {
  final TeachersGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  SoundButton(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 0.25,
      game.tileSize * 8.5,
      game.tileSize * 4,
      game.tileSize * 4,
    );
    enabledSprite = Sprite('ui/sound/sound_enabled.png');
    disabledSprite = Sprite('ui/sound/sound_disabled.png');
  }

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, rect);
    } else {
      disabledSprite.renderRect(c, rect);
    }
  }

  void onTapDown() {
    isEnabled = !isEnabled;
  }
}