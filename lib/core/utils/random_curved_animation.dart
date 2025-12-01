import 'dart:math';

import 'package:flutter/material.dart';

class RandomCurver {
  static final List<Curve> _list = [
    Curves.bounceIn,
    Curves.bounceInOut,
    Curves.decelerate,
    Curves.linear,
    Curves.ease,
    Curves.easeIn,
    Curves.easeInOut,
    Curves.easeOut,
    Curves.fastEaseInToSlowEaseOut,
    Curves.fastOutSlowIn,
    Curves.elasticIn,
    Curves.elasticInOut,
    Curves.elasticOut,
    Curves.elasticIn,
    Curves.easeIn,
  ];

  static Curve get curve {
    final _random = Random.secure().nextInt(_list.length - 1);
    final _c = _list[_random];
    return _c;
  }

  static Curve indexedCurve(int index) => _list[index];
}
