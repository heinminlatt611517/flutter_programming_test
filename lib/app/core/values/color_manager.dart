import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#2E4972");
  static Color darkGrey = HexColor.fromHex("#183567");
  static Color grey = HexColor.fromHex("#737477");
  static Color textFieldFillColor = HexColor.fromHex("#E0E0E0");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#9E9E9E");
  static Color yellow = HexColor.fromHex("ED9728");
  static Color red = HexColor.fromHex("#DD4F63");
  static Color blue = HexColor.fromHex("#007AFF");
  static Color green = HexColor.fromHex("#00A44f");
  static Color pink = HexColor.fromHex("#FFC0CB");



//new colors
  static Color darkPrimary = HexColor.fromHex("#203859");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000");
  static Color greyLight = HexColor.fromHex("#F2F3F5");
  // black color

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
