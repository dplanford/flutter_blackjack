import 'dart:math';

class RandomHelper {
  static int randomTimeSeed() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  /// Return a random int between 0 and the passed in max (up to max - 1)
  static int returnRandomInt({
    int max = 10,
  }) {
    var randInt = Random(RandomHelper.randomTimeSeed());
    return randInt.nextInt(max);
  }

  /// Return a random double between 0 and the passed in max
  static double returnRandomDouble({
    double min = 0.0,
    double max = 1.0,
  }) {
    var randDouble = Random(RandomHelper.randomTimeSeed());
    return (randDouble.nextDouble() * (-min + max)) - min;
  }
}
