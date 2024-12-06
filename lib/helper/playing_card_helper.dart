import 'package:blackjack_package/helper/random_helper.dart';

enum PlayingCardSuit {
  hearts,
  spades,
  clubs,
  diamonds,
}

enum PlayingCardValue {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace,
}

class PlayingCard {
  PlayingCardSuit suit;
  PlayingCardValue value;

  PlayingCard({
    // default of 2 of hearts....
    this.suit = PlayingCardSuit.hearts,
    this.value = PlayingCardValue.two,
  });

  static const String cardBack = 'assets/images/cards/back.png';

  static String fileName(PlayingCard? card) {
    String fileName = '';

    if (card == null) {
      return PlayingCard.cardBack;
    }

    switch (card.suit) {
      case PlayingCardSuit.clubs:
        fileName += 'C-';
        break;
      case PlayingCardSuit.diamonds:
        fileName += 'D-';
        break;
      case PlayingCardSuit.hearts:
        fileName += 'H-';
        break;
      case PlayingCardSuit.spades:
        fileName += 'S-';
        break;
    }

    switch (card.value) {
      case PlayingCardValue.two:
        fileName += '2';
        break;
      case PlayingCardValue.three:
        fileName += '3';
        break;
      case PlayingCardValue.four:
        fileName += '4';
        break;
      case PlayingCardValue.five:
        fileName += '5';
        break;
      case PlayingCardValue.six:
        fileName += '6';
        break;
      case PlayingCardValue.seven:
        fileName += '7';
        break;
      case PlayingCardValue.eight:
        fileName += '8';
        break;
      case PlayingCardValue.nine:
        fileName += '9';
        break;
      case PlayingCardValue.ten:
        fileName += '10';
        break;
      case PlayingCardValue.jack:
        fileName += 'J';
        break;
      case PlayingCardValue.queen:
        fileName += 'Q';
        break;
      case PlayingCardValue.king:
        fileName += 'K';
        break;
      case PlayingCardValue.ace:
        fileName += 'A';
        break;
    }

    return 'assets/images/cards/$fileName.png';
  }

  static int blackjackCardValue(PlayingCard card) {
    switch (card.value) {
      case PlayingCardValue.two:
        return 2;
      case PlayingCardValue.three:
        return 3;
      case PlayingCardValue.four:
        return 4;
      case PlayingCardValue.five:
        return 5;
      case PlayingCardValue.six:
        return 6;
      case PlayingCardValue.seven:
        return 7;
      case PlayingCardValue.eight:
        return 8;
      case PlayingCardValue.nine:
        return 9;
      case PlayingCardValue.ten:
        return 10;
      case PlayingCardValue.jack:
        return 10;
      case PlayingCardValue.queen:
        return 10;
      case PlayingCardValue.king:
        return 10;
      case PlayingCardValue.ace:
        // TODO: handle 1/11 case for the ace! depending on the blackjack hand!
        return 11;
      default:
        return 0;
    }
  }

  static List<PlayingCard> getShuffledSingleDeck({bool unshuffled = false}) {
    List<PlayingCard> coreCards = [];

    // First build a complete list of the 52 cards (4 suits, 13 cards each).
    for (PlayingCardSuit suit in PlayingCardSuit.values) {
      for (PlayingCardValue cardValue in PlayingCardValue.values) {
        coreCards.add(PlayingCard(suit: suit, value: cardValue));
      }
    }

    if (unshuffled) {
      return coreCards;
    }

    // Then randomly shuffle the deck...
    List<PlayingCard> shuffledDeck = [];

    while (coreCards.isNotEmpty) {
      int randCard = RandomHelper.returnRandomInt(max: coreCards.length);
      PlayingCard card = coreCards[randCard];
      shuffledDeck.add(card);
      coreCards.removeAt(randCard);
    }

    return shuffledDeck;
  }

  static List<PlayingCard> getShuffledMultiDeck(int numDecks) {
    List<PlayingCard> coreCards = [];

    // And wrap it in a multi-deck initial list including the input number of decks....
    for (int i = 0; i < numDecks - 1; i++) {
      // First build a complete list of the 52 cards (4 suits, 13 cards each).
      for (PlayingCardSuit suit in PlayingCardSuit.values) {
        for (PlayingCardValue cardValue in PlayingCardValue.values) {
          coreCards.add(PlayingCard(suit: suit, value: cardValue));
        }
      }
    }
    // Then randomly shuffle the deck...
    List<PlayingCard> shuffledDeck = [];

    while (coreCards.isNotEmpty) {
      int randCard = RandomHelper.returnRandomInt(max: coreCards.length);
      PlayingCard card = coreCards[randCard];
      shuffledDeck.add(card);
      coreCards.removeAt(randCard);
    }

    return shuffledDeck;
  }

  /// For Texas Holdem....
  /// Take 7 cards, and build the best 5 card hand possible...
  /// TODO!
}
