import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void setCount(int val) {
    _count = val;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
