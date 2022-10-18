import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  double _page = 0;
  double get page => _page;
  set spage(int value) {
    _page = value.toDouble();
    notifyListeners();
  }
}
