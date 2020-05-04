import 'dart:math';

import 'package:flutter/widgets.dart';

class Station {
  String name;
  String prefix;
  int min;
  int max;
  int length;
  Icon icon;

  Station({this.name, this.prefix, this.min, this.max, this.length, this.icon});

  final random = Random();

  String generateNewCode() {
    int code = random.nextInt(max) + min;
    return prefix + '$code'.padLeft(length, '0');
  }
}
