import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_langaw/components/teachers/gold-coin.dart';
import 'package:flutter_langaw/views/shop-interface.dart';
import 'components/ui/dambg.dart';
import 'components/ui/ecaib-display.dart';
import 'components/ui/gold-display.dart';
import 'components/ui/minigame-button.dart';
import 'components/ui/shop-button.dart';
import 'components/superclass/teacher.dart';
import 'components/ui/teachers-home-button.dart';
import 'components/teachers/carles.dart';
import 'view.dart';

class TeachersGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  int gold;
  int ecaibs;

  Dambg background;

  View activeView = View.playing;

  MinigameButton minigameButton;
  ShopButton shopButton;
  TeachersHomeButton teachersButton;

  GoldDisplay goldDisplay;
  EcaibDisplay ecaibDisplay;
  ShopInterface shopInterface;

  List<Teacher> teachers;
  List<GoldCoin> goldCoins;

  TeachersGame() {
    initialize();
  }

  void initialize() async {
    gold = 0;
    ecaibs = 0;
    teachers = List<Teacher>();
    goldCoins = List<GoldCoin>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    shopInterface = ShopInterface(this);
    goldDisplay = GoldDisplay(this);
    ecaibDisplay = EcaibDisplay(this);
    background = Dambg(this);
    minigameButton = MinigameButton(this);
    shopButton = ShopButton(this);
    teachersButton = TeachersHomeButton(this);
    spawnTeacher();
  }

  void spawnTeacher() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    teachers.add(Carles(this, x, y));
  }

  void spawnGoldCoins() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    goldCoins.add(GoldCoin(this, x, y));
  }

  void render(Canvas canvas) {
    background.render(canvas);
    teachers.forEach((Teacher teacher) => teacher.render(canvas));
    goldCoins.forEach((GoldCoin goldCoin) => goldCoin.render(canvas));
    goldDisplay.render(canvas);
    ecaibDisplay.render(canvas);
    minigameButton.render(canvas);
    shopButton.render(canvas);
    teachersButton.render(canvas);

    if (activeView == View.shop) {
      shopInterface.render(canvas);
    }
  }

  void update(double t) {
    teachers.forEach((Teacher teacher) => teacher.update(t));
    goldDisplay.update(t);
    ecaibDisplay.update(t);
    goldCoins.removeWhere((GoldCoin gc) => gc.isTapped);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = 16;
  }

  void onTapDown(TapDownDetails d) {
    teachers.forEach((Teacher teacher) {
      if (teacher.teacherRect.contains(d.globalPosition)) {
        teacher.onTapDown();

      }
    });

    goldCoins.forEach((GoldCoin gc) {
      if (gc.goldCoinRect.contains(d.globalPosition)) {
        gc.onTapDown();
      }
    });

    if (shopButton.rect.contains(d.globalPosition)) {
      shopButton.onTapDown();
    }
  }
}
