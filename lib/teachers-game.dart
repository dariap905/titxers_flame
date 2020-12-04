import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'components/dambg.dart';
import 'components/ecaib-display.dart';
import 'components/gold-display.dart';
import 'components/minigame-button.dart';
import 'components/shop-button.dart';
import 'components/teacher.dart';
import 'components/teachers-button.dart';
import 'components/teachers/carles.dart';
import 'view.dart';
import 'views/home-view.dart';

class TeachersGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  int gold;
  int ecaibs;

  Dambg background;
  View activeView = View.home;
  HomeView homeView;

  MinigameButton minigameButton;
  ShopButton shopButton;
  TeachersHomeButton teachersButton;

  GoldDisplay goldDisplay;
  EcaibDisplay ecaibDisplay;

  List<Teacher> teachers;

  TeachersGame() {
    initialize();
  }

  void initialize() async {
    gold = 55;
    ecaibs = 777;
    teachers = List<Teacher>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());

    goldDisplay = GoldDisplay(this);
    ecaibDisplay = EcaibDisplay(this);
    homeView = HomeView(this);
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
    teachers.add(Carles(this, x, y));
    teachers.add(Carles(this, x, y));
  }

  void render(Canvas canvas) {
    background.render(canvas);
    teachers.forEach((Teacher teacher) => teacher.render(canvas));
    if (activeView == View.home) {
      goldDisplay.render(canvas);
      ecaibDisplay.render(canvas);
      homeView.render(canvas);
      minigameButton.render(canvas);
      shopButton.render(canvas);
      teachersButton.render(canvas);
    }

  }

  void update(double t) {
    teachers.forEach((Teacher teacher) => teacher.update(t));
    if (activeView == View.home){
      goldDisplay.update(t);
      ecaibDisplay.update(t);
    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    teachers.forEach((Teacher teacher) {
      if (teacher.teacherRect.contains(d.globalPosition)) {
        teacher.onTapDown();
      }
    });
  }

}