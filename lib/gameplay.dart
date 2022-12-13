import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dino_game.dart';
import 'helpers/navigation_keys.dart';

class GamePlayPage extends StatefulWidget{
  const GamePlayPage({super.key});
  @override
  GamePlayPageState createState() => GamePlayPageState();
}

class GamePlayPageState extends State<GamePlayPage>{
  final game=DinoGame();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: game,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: NavigationKeys(onDirectionChanged: game.onArrowKeyChanged,
            ),
          ),
        ],
      ),
    );
  }
}