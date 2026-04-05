import 'package:marketi/core/responsive/dimensions.dart';

extension Extensions on num {
  get h => Dimensions.deviceHeightPercentage() * this;
  get w => Dimensions.deviceWidthPercentage() * this;
  get r => Dimensions.deviceShortestSidePercentage() * this;
  get s => Dimensions.deviceShortestSidePercentage() * this;
}
