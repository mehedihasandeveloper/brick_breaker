import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  // ball variables
  final ballx;
  final bally;
  const MyBall({
    super.key,
    this.ballx,
    this.bally,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballx, bally),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
