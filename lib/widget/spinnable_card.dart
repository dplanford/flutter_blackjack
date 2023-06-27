import 'package:flutter/material.dart';

class SpinnableCard extends StatelessWidget {
  final String imageFileName;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  const SpinnableCard({
    required this.imageFileName,
    this.rotationX = 0,
    this.rotationY = 0,
    this.rotationZ = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX)
        ..rotateY(rotationY)
        ..rotateZ(rotationZ),
      alignment: Alignment.center,
      child: Image.asset(imageFileName),
    );
  }
}
