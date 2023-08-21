import 'package:flutter/material.dart';

class AppColors {
  //this is primary app color
  static const Color mainBlue = Colors.blueAccent;
  static const Color black = Colors.black87;
  static const Color white = Colors.white54;

  static Color shimmerBaseColor = Colors.blueGrey.withOpacity(0.5);
  static Color shimmerHighlightColor = Colors.blueGrey.withOpacity(0.2);
  static Color shimmerBackgroundColor(Brightness brightness) {
    return brightness == Brightness.light ? Colors.blueGrey : Colors.blueGrey.withOpacity(0.5);
  }
}
