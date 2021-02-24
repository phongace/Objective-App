import 'package:flutter/material.dart';

class CommonStyle {
  static Color whiteColor = Color(0xffffffff);

  static Color primaryColor = Color(0xff286BCF);

  static Color bgColor = Color(0xffF4F4F5);

  static Color blackColor = Color(0xff000000);

  static TextStyle defaultText(BuildContext context, {double textSize, Color color}) {
    return TextStyle(
      fontSize: textSize == null ? 18 : textSize,
      color: color == null ? primaryColor : color,
    );
  }

  static TextStyle blurText(BuildContext context, {double textSize, Color color}) {
    return TextStyle(
      fontSize: textSize == null ? 18 : textSize,
      color: color ?? blackColor,
    );
  }

  static TextStyle boldText(BuildContext context, {double textSize, Color color}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: textSize == null ? 18 : textSize,
      color: color == null ? primaryColor : color,
    );
  }
}
