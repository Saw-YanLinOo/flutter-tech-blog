import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  bool get isTablet {
    final double deviceWidth = MediaQuery.of(this).size.width;
    return deviceWidth >= 600;
  }
}

extension Navigation on BuildContext {
  Future toNextScreen(Widget widget) {
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => widget));
  }

  void pop<T extends Object>([T? result]) {
    return Navigator.pop(this, result);
  }
}
