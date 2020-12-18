import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'components/teachers/gold-coin.dart';
import 'components/ui/close-icon.dart';
import 'views/shop-interface.dart';
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
  
  CloseIcon closeIcon;

  List<Teacher> teachers;
  List<GoldCoin> goldCoins;

  TeachersGame() {
    initialize();
  }

  void initialize() async {
    gold = 150;
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
    closeIcon = CloseIcon(this);
    spawnTeacher();
  }

  void spawnTeacher() {

    //randomize spawning
    /*
    * switch (rnd.nextInt(5)) {
  case 0:
    flies.add(HouseFly(this, x, y));
    break;
  case 1:
    flies.add(DroolerFly(this, x, y));
    break;
  case 2:
    flies.add(AgileFly(this, x, y));
    break;
  case 3:
    flies.add(MachoFly(this, x, y));
    break;
  case 4:
    flies.add(HungryFly(this, x, y));
    break;
}*/
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    teachers.add(Carles(this, x, y));
  }

  void spawnGoldCoins(int x, int y) {
    /*double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);*/
    goldCoins.add(GoldCoin(this, x.toDouble() + tileSize * 3 , y.toDouble() + tileSize * 3 ));
  }

  void render(Canvas c) {
    background.render(c);
    teachers.forEach((Teacher teacher) => teacher.render(c));
    goldCoins.forEach((GoldCoin goldCoin) => goldCoin.render(c));
    goldDisplay.render(c);
    ecaibDisplay.render(c);
    minigameButton.render(c);
    shopButton.render(c);
    teachersButton.render(c);

    if (activeView == View.shop) {
      shopInterface.render(c);
      closeIcon.render(c);
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

    if(shopInterface.shopInterfaceRect.contains(d.globalPosition)){
      shopInterface.onTapDown();
    }

    if(closeIcon.ciRect.contains(d.globalPosition)){
      closeIcon.onTapDown();
    }
  }
}
