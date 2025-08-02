import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(PageRouteBuilder page) {
    Navigator.of(this).push(page);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
