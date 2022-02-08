import 'package:flutter/material.dart';

class Helper {
  static double getScreeWidth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName(String type, String fileName) {
    return "assets/$type/$fileName";
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
