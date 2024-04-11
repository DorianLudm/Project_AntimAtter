import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';

import 'game/game_screen.dart';
import 'home/home_screen.dart';

class GameManager extends FlameGame {
  late GameScreen _gameScreen;
  late HomeScreen _mainScreen;
  final BuildContext context;

  GameManager(this.context) {
    _mainScreen = HomeScreen(() {
      remove(_mainScreen);
      _gameScreen = GameScreen();
      add(_gameScreen);
    });
  }

  @override
  Future<void>? onLoad() {
    add(_mainScreen);
    return null;
  }
}