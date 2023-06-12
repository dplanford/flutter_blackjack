import 'dart:math';

class RandomDateHelper {
  static int randomTimeSeed() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  /// Return a random int between 0 and the passed in max (up to max - 1)
  static int returnRandomInt({
    int max = 10,
  }) {
    var randInt = Random(RandomDateHelper.randomTimeSeed());
    return randInt.nextInt(max);
  }
}
