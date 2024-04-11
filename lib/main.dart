import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:project_antimatter/game_manager.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project Antimatter",
      debugShowCheckedModeBanner: false,
      home: GameWidget(game: GameManager(context)),
    );
  }
}