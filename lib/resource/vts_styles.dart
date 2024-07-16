import 'package:flutter/material.dart';

import 'vts_colors.dart';
import 'vts_dimes.dart';

// DATA THEME
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    color: VtsColors.primaryColor,
  ),
  scaffoldBackgroundColor: VtsColors.backgroundLightColor,
);

// TEXT STYLE
class CSPTextStyle {
  CSPTextStyle._();

  static TextStyle textStyleSmall = TextStyle(
    color: VtsColors.textDarkColor,
    fontSize: VtsDimens.text12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyleNormal = TextStyle(
    color: VtsColors.textDarkColor,
    fontSize: VtsDimens.text12 + 2,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyleMedium = TextStyle(
    color: VtsColors.textDarkColor,
    fontSize: VtsDimens.text18,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyleLargest = TextStyle(
    color: VtsColors.textDarkColor,
    fontSize: VtsDimens.text24,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyleSuperLargest = TextStyle(
    color: VtsColors.textDarkColor,
    fontSize: VtsDimens.text12 + 2,
    fontWeight: FontWeight.normal,
  );
}
