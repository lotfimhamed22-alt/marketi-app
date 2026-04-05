import 'package:flutter/widgets.dart';

class Dimensions {
  static final _mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );

  static double deviceHeightPercentage() {
    return _mediaQueryData.size.height / 1000;
  }

  static double deviceWidthPercentage() {
    return _mediaQueryData.size.width / 500;
  }

  static double deviceShortestSidePercentage() {
    return _mediaQueryData.size.shortestSide / 500;
  }
}
