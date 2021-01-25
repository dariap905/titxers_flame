import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_langaw/components/ui/music-button.dart';
import 'package:flutter_langaw/components/ui/sound-button.dart';
import 'package:flutter_langaw/views/answer-interface.dart';
import 'package:flutter_langaw/views/choose_field_interface.dart';
import 'components/items/gold-coin.dart';
import 'components/ui/a.dart';
import 'components/ui/audio/background-music.dart';
import 'components/ui/b.dart';
import 'components/ui/c.dart';
import 'components/ui/close-icon.dart';
import 'views/shop-interface.dart';
import 'components/ui/bg.dart';
import 'components/ui/ecaib-display.dart';
import 'components/ui/gold-display.dart';
import 'components/ui/minigame-button.dart';
import 'components/ui/shop-button.dart';
import 'components/superclass/teacher.dart';
import 'components/ui/teachers-home-button.dart';
import 'components/teachers/carles.dart';
import 'view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

class TeachersGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;

  final SharedPreferences storage;

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
  ChooseQuestionField chooseFamily;
  AnswerInterface answerInterface;
  A aAnswer;
  B bAnswer;
  C cAnswer;
  
  CloseIcon closeIcon;

  List<Teacher> teachers;
  List<GoldCoin> goldCoins;

  MusicButton musicButton;
  SoundButton soundButton;

  AudioPlayer bgm;

  TeachersGame(this.storage) {
    initialize();
  }

  void initialize() async {
    gold = 999;
    ecaibs = 50;
    teachers = List<Teacher>();
    goldCoins = List<GoldCoin>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    shopInterface = ShopInterface(this);
    chooseFamily = ChooseQuestionField(this);
    answerInterface = AnswerInterface(this);
    aAnswer = A(this);
    bAnswer = B(this);
    cAnswer = C(this);
    goldDisplay = GoldDisplay(this);
    ecaibDisplay = EcaibDisplay(this);
    background = Dambg(this);
    minigameButton = MinigameButton(this);
    shopButton = ShopButton(this);
    teachersButton = TeachersHomeButton(this);
    closeIcon = CloseIcon(this);
    musicButton = MusicButton(this);
    soundButton = SoundButton(this);

    /* source: https://patrickdearteaga.com/arcade-music/ */

    bgm = await Flame.audio.loop('bgm.mp3', volume: 1);
    //bgm.pause();

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
    double x = rnd.nextDouble() * (screenSize.width - tileSize * 12);
    double y = rnd.nextDouble() * (screenSize.height - tileSize * 12);
    teachers.add(Carles(this, x, y));
  }

  void spawnGoldCoins() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize * 11);
    double y = rnd.nextDouble() * (screenSize.height - tileSize * 11);
    goldCoins.add(GoldCoin(this, x.toDouble() + tileSize * 3 , y.toDouble() + tileSize * 3 ));
  }

  void render(Canvas c) {

    //active.view = playing
    background.render(c);
    teachers.forEach((Teacher teacher) => teacher.render(c));
    goldCoins.forEach((GoldCoin goldCoin) => goldCoin.render(c));
    goldDisplay.render(c);
    ecaibDisplay.render(c);
    shopButton.render(c);
    minigameButton.render(c);
    teachersButton.render(c);
    musicButton.render(c);
    soundButton.render(c);

    if (activeView == View.shop) {
      shopInterface.render(c);
      closeIcon.render(c);
    }

    if (activeView == View.questions) {
      chooseFamily.render(c);
      closeIcon.render(c);
    }

    if(activeView == View.answers){
      answerInterface.render(c);
      closeIcon.render(c);
      aAnswer.render(c);
      bAnswer.render(c);
      cAnswer.render(c);
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

  //Remember that objects on top should receive tap events first

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
      shopInterface.onTapDown(d);
    }

    if(closeIcon.ciRect.contains(d.globalPosition)){
      closeIcon.onTapDown();
    }

    if (minigameButton.minigameRect.contains(d.globalPosition)) {
      minigameButton.onTapDown();
    }

    if(activeView == View.questions){
      if (chooseFamily.questionsRect.contains(d.globalPosition)) {
        chooseFamily.onTapDown();
      }
    }

    // music button
    if (musicButton.rect.contains(d.globalPosition)) {
      musicButton.onTapDown();
    }

    // sound button
    if (soundButton.rect.contains(d.globalPosition)) {
      soundButton.onTapDown();
    }
  }
}
