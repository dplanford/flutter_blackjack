import 'dart:async';
import 'dart:math';

import 'package:blackjack_package/helper/random_helper.dart';
import 'package:flutter/material.dart';

import 'package:blackjack_package/helper/playing_card_helper.dart';
import 'package:blackjack_package/widget/playing_card_widget.dart';

const double piDiv2 = pi / 2.0;
const double pi2 = 2.0 * pi;

class PlayingCardDeckSpinnyWidget extends StatefulWidget {
  const PlayingCardDeckSpinnyWidget({super.key});

  @override
  State<PlayingCardDeckSpinnyWidget> createState() => _PlayingCardDeckSpinnyWidgetState();
}

class _PlayingCardDeckSpinnyWidgetState extends State<PlayingCardDeckSpinnyWidget> {
  List<PlayingCard> _myDeck = [];
  double _rotationX = piDiv2;
  double _rotationZ = 0;
  int _cardIndex = 0;
  bool _backShowing = false;

  @override
  void initState() {
    super.initState();

    _myDeck = PlayingCard.getShuffledSingleDeck();

    _rotationX = RandomHelper.returnRandomDouble(min: -piDiv2, max: piDiv2);
    _rotationZ = RandomHelper.returnRandomDouble(min: -piDiv2, max: piDiv2);
    if (_rotationX > -piDiv2 && _rotationX < piDiv2) {
      _backShowing = false;
    }

    // TODO: Update timer is set to 60 updates per second (16667 microseconds)...
    // This seems to work pretty smoothly as a Flutter gaming animation update loop?
    Timer.periodic(
      const Duration(microseconds: 16667),
      (timer) => updateAnim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlayingCardWidget(
      card: _backShowing ? null : _myDeck[_cardIndex],
      rotationX: _rotationX,
      rotationZ: _rotationZ,
    );
  }

  void updateAnim() {
    setState(() {
      _rotationX -= 0.02;
      if (_rotationX < -pi) {
        _rotationX += pi2;
      }

      _rotationZ += 0.005;
      if (_rotationZ > pi) {
        _rotationZ -= pi2;
      }

      if (_rotationX > -piDiv2 && _rotationX < piDiv2) {
        if (_backShowing) {
          _backShowing = false;
          if (_cardIndex >= _myDeck.length - 1) {
            _cardIndex = 0;
          } else {
            _cardIndex += 1;
          }
        }
      } else if (!_backShowing) {
        _backShowing = true;
      }
    });
  }
}
