import 'package:flutter/widgets.dart';

class BoxSideConfig {
  double boxSideWidthLogic(Orientation orientation, double boxSide) {
    if (orientation.index == Orientation.landscape.index) {
      return boxSide;
    } else {
      return boxSide + 35;
    }
  }

  double boxSideHeightLogic(Orientation orientation, double boxSide) {
    if (orientation.index == Orientation.landscape.index) {
      return boxSide + 40;
    } else {
      return boxSide;
    }
  }
}
