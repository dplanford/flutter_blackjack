import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:blackjack_package/helper/playing_card_helper.dart';
import 'package:blackjack_package/widget/playing_card_widget.dart';

const double piDiv2 = pi / 2.0;
const double pi2 = 2 * pi;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cardIndex = 0;
  List<PlayingCard> _cards = [];
  double _rotationX = piDiv2;
  double _rotationZ = 0;
  bool _backShowing = false;

  @override
  void initState() {
    super.initState();
    _cards = PlayingCard.getShuffledSingleDeck(unshuffled: true);

    // TODO: Update timer is set to 60 updates per second (16667 microseconds)...
    // This seems to work pretty smoothly as a Flutter gaming animation update loop?
    Timer.periodic(
      const Duration(microseconds: 16667),
      (timer) => updateAnim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack Test....'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: const Text('New Shuffle!'),
            onPressed: () {
              setState(() {
                _cards = PlayingCard.getShuffledSingleDeck();
                _cardIndex = 0;
                _rotationX = piDiv2;
                _rotationZ = 0;
              });
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: PlayingCardWidget(
                card: _backShowing ? null : _cards[_cardIndex],
                rotationX: _rotationX,
                rotationZ: _rotationZ,
              ),
            ),
          ),
          Text('Card: $_cardIndex'),
          const SizedBox(height: 16),
        ],
      ),
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
        _rotationZ += pi2;
      }

      if (_rotationX > -piDiv2 && _rotationX < piDiv2) {
        if (_backShowing) {
          _backShowing = false;
          if (_cardIndex >= _cards.length - 1) {
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
