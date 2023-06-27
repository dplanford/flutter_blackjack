import 'package:blackjack_package/widget/spinnable_card.dart';
import 'package:flutter/material.dart';

import 'package:blackjack_package/helper/playing_card_helper.dart';

class PlayingCardWidget extends StatelessWidget {
  final PlayingCard? card;
  final double rotationX;
  final double rotationZ;

  const PlayingCardWidget({
    this.card,
    this.rotationX = 0,
    this.rotationZ = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinnableCard(
      imageFileName: PlayingCard.fileName(card),
      rotationX: rotationX,
      rotationZ: rotationZ,
    );
    /*
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX)
        ..rotateZ(rotationZ),
      alignment: Alignment.center,
      child: Image.asset(PlayingCard.fileName(card)),
    );
    */
  }
}
