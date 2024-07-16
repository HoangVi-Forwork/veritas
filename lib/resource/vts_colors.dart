import 'package:flutter/material.dart';

class VtsColors {
  // BACKGROUND COLORS
  static var primaryColor = HexColor('#4f4888');
  static var backgroundDarkColor = HexColor('#2c2f38');
  static var backgroundLightColor = HexColor('#ffffff');
  static var whileColors = HexColor('#ffffff');

  // TEXT COLORS
  static var textLightColor = HexColor('#f2f2f2');
  static var textDarkColor = HexColor('#333333');

  // BORDER AND DRIVER COLORS
  static var dividerColor = HexColor('##808080');

  // ERROR COLOR
  static var errorColor = HexColor('##992600');

  // Order
  static var appDisableColor = HexColor('##808080');
}

// Parse hex to color.
class HexColor extends Color {
  final String valueString;

  static int _getColorFromHex(hexColor) {
    hexColor ??= '#FFFFFF';
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(this.valueString) : super(_getColorFromHex(valueString));
}
