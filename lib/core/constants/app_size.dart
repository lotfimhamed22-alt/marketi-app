import 'package:flutter/widgets.dart';

class AppSize {
  static late MediaQueryData mediaQuery;
  static void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
  }

  static double get width => mediaQuery.size.width;
  static double get height => mediaQuery.size.height;
}
