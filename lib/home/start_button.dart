import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

import 'package:project_antimatter/game_manager.dart';

class StartButton extends SpriteComponent with TapCallbacks, HasGameRef<GameManager> {
  final VoidCallback onTap;
  var height = 50;

  StartButton(this.onTap, Sprite sprite) : super(sprite: sprite);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    var originalSize = sprite?.originalSize;
    width = gameRef.size.toSize().width/5;
    height = (originalSize!.toSize().height * (width / originalSize.toSize().width))!;
    size = Vector2(width, height); // Adjust size as needed
    anchor = Anchor.center;
    double screenWidth = gameRef.size.toSize().width;
    double screenHeight = gameRef.size.toSize().height;
    position = Vector2(screenWidth/2, screenHeight/2); // Adjust position as needed
  }

  @override
  void onTapUp(TapUpEvent event) {
    onTap();
  }
}