import 'package:flutter/material.dart';

class AppColors{
  ///Base color code
  static int baseColor = 0xFF24232B;
  ///Primary color
  static var primaryColor = MaterialColor(AppColors.baseColor, colorCodes);
  static const Color lightWhite = Color(0xFFF6F9FF);
  static  Color lightGrayLayoutColor = const Color(0xFFF6F8FA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF2661A3);
  static const Color green = Color(0xFF3B8441);
  static const Color black = Colors.black;
  static const Color textFieldFillColor = Color(0xFF1D1C22);

}

/// RGB Color use to generate primary color
int rColor =  36;
int gColor =  35;
int bColor =  43;

Map<int, Color> colorCodes = {
  50: Color.fromRGBO(rColor, gColor, bColor, .1),
  100: Color.fromRGBO(rColor, gColor, bColor, .2),
  200: Color.fromRGBO(rColor, gColor, bColor, .3),
  300: Color.fromRGBO(rColor, gColor, bColor, .4),
  400: Color.fromRGBO(rColor, gColor, bColor, .5),
  500: Color.fromRGBO(rColor, gColor, bColor, .6),
  600: Color.fromRGBO(rColor, gColor, bColor, .7),
  700: Color.fromRGBO(rColor, gColor, bColor, .8),
  800: Color.fromRGBO(rColor, gColor, bColor, .9),
  900: Color.fromRGBO(rColor, gColor, bColor, 1),
};