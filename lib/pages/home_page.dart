import 'dart:async';

import 'package:brick_breaker/materials/ball.dart';
import 'package:brick_breaker/materials/coverscreen.dart';
import 'package:brick_breaker/materials/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ball variables
  double ballx = 0;
  double bally = 0;

  // player variables
  double playerX = 0;
  double playerWidth = 0.3; // out of 2

  // game settings
  bool hasGameStarted = false;

  // start game
  void startGame() {
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        bally += 0.001;
      });
    });
  }

  // move player left
  void moveLeft() {
    setState(() {
      // only move left if moving left doesn't move player off the screen
      if (!(playerX <= -1)) {
        playerX -= 0.02;
      }
    });
  }

  // move player right
  void moveRight() {
    // only move right if moving right doesn't move player off the screen
    if (!(playerX >= 1)) {
      playerX += 0.02;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        // ignore: deprecated_member_use
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
          // ignore: deprecated_member_use
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.deepPurple[100],
          body: Center(
            child: Stack(
              children: [
                // tab to play
                CoverScreen(
                  hasGameStarted: hasGameStarted,
                ),

                // ball
                MyBall(
                  ballx: ballx,
                  bally: bally,
                ),

                // player
                MyPlayer(
                  playerX: playerX,
                  playerWidth: playerWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
