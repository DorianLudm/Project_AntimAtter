import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'package:project_antimatter/game_manager.dart';
import 'package:project_antimatter/home/start_button.dart';
import 'package:project_antimatter/utils/cropped_background.dart';

class HomeScreen extends Component with HasGameRef<GameManager> {
  late SpriteComponent _background;
  late SpriteComponent _gameName;
  late StartButton _startButton;
  final VoidCallback onStartClicked;

  HomeScreen(this.onStartClicked);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    var backgroundImage = await Sprite.load('bg.jpg'); // Replace 'bg.png' with your image's file path
    var gameNameSprite = await Sprite.load('game_name.png');
    var buttonSprite = await Sprite.load('start_button.png'); // Replace 'button.png' with your sprite's file path
    double screenWidth = gameRef.size.toSize().width;
    double screenHeight = gameRef.size.toSize().height;
    _background = SpriteComponent(
      sprite: backgroundImage,
      size: Vector2(screenWidth, screenHeight), // Adjust size as needed
    );;
    _startButton = StartButton(onStartClicked, buttonSprite);
    _gameName = SpriteComponent(
      sprite: gameNameSprite,
      size: Vector2(screenWidth/2, screenWidth/9), // Adjust size as needed
      position: Vector2(screenWidth/4, screenWidth/4)
    );
    add(_background);
    add(_gameName);
    add(_startButton);
  }
}