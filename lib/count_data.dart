import 'package:flutter/material.dart';

class CountData {

  static ValueNotifier<int> count = ValueNotifier(0);

  void addData () {
    count.value += 1;
  }

  void subData () {
    count.value -= 1;
  }
}