import 'package:flutter/material.dart';

import 'package:blackjack_package/widget/playing_card_deck_spinny_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack Card Spinny Test!'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
                PlayingCardDeckSpinnyWidget(),
                SizedBox(width: 4),
              ],
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
