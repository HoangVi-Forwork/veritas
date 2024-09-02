import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';
>>>>>>> Stashed changes

class UiUtil {
  UiUtil._();

  // spacing
  static const verticalSpace2 = SizedBox(height: 2.0);
  static const verticalSpace4 = SizedBox(height: 4.0);
  static const verticalSpace6 = SizedBox(height: 6.0);
  static const verticalSpace8 = SizedBox(height: 8.0);
  static const verticalSpace10 = SizedBox(height: 10.0);
  static const verticalSpace12 = SizedBox(height: 12.0);
  static const verticalSpace16 = SizedBox(height: 16.0);
  static const verticalSpace22 = SizedBox(height: 22.0);
  static const verticalSpace24 = SizedBox(height: 24.0);
  static const verticalSpace30 = SizedBox(height: 30.0);
  static const verticalSpace40 = SizedBox(height: 40.0);
  static const verticalSpace50 = SizedBox(height: 50.0);
  static const verticalSpaceToolbar = SizedBox(height: kToolbarHeight);

  static const horizontalSpace2 = SizedBox(width: 2.0);
  static const horizontalSpace4 = SizedBox(width: 4.0);
  static const horizontalSpace8 = SizedBox(width: 8.0);
  static const horizontalSpace10 = SizedBox(width: 10.0);
  static const horizontalSpace12 = SizedBox(width: 12.0);
  static const horizontalSpace16 = SizedBox(width: 16.0);
  static const horizontalSpace20 = SizedBox(width: 20.0);
  static const horizontalSpace22 = SizedBox(width: 22.0);
  static const horizontalSpace24 = SizedBox(width: 24.0);

  // padding / margin
  static const paddingAll0 = EdgeInsets.all(0.0);
  static const paddingAll2 = EdgeInsets.all(2.0);
  static const paddingAll4 = EdgeInsets.all(4.0);
  static const paddingAll8 = EdgeInsets.all(8.0);
  static const paddingAll10 = EdgeInsets.all(10.0);
  static const paddingAll12 = EdgeInsets.all(12.0);
  static const paddingAll14 = EdgeInsets.all(14.0);
  static const paddingAll16 = EdgeInsets.all(16.0);
  static const paddingAll20 = EdgeInsets.all(20.0);
  static const paddingAll22 = EdgeInsets.all(22.0);
  static const paddingAll50 = EdgeInsets.all(50.0);

  static const verticalPadding4 = EdgeInsets.symmetric(vertical: 4.0);
  static const verticalPadding6 = EdgeInsets.symmetric(vertical: 6.0);
  static const verticalPadding8 = EdgeInsets.symmetric(vertical: 8.0);
  static const verticalPadding12 = EdgeInsets.symmetric(vertical: 12.0);
  static const verticalPadding14 = EdgeInsets.symmetric(vertical: 14.0);
  static const verticalPadding16 = EdgeInsets.symmetric(vertical: 16.0);
  static const verticalPadding20 = EdgeInsets.symmetric(vertical: 20.0);
  static const verticalPadding22 = EdgeInsets.symmetric(vertical: 22.0);
  static const verticalPadding48 = EdgeInsets.symmetric(vertical: 48.0);
  static const verticalPadding50 = EdgeInsets.symmetric(vertical: 50.0);

  static const horizontalPadding1 = EdgeInsets.symmetric(horizontal: 1.0);
  static const horizontalPadding4 = EdgeInsets.symmetric(horizontal: 4.0);
  static const horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8.0);
  static const horizontalPadding10 = EdgeInsets.symmetric(horizontal: 10.0);
  static const horizontalPadding12 = EdgeInsets.symmetric(horizontal: 12.0);
  static const horizontalPadding14 = EdgeInsets.symmetric(horizontal: 14.0);
  static const horizontalPadding15 = EdgeInsets.symmetric(horizontal: 15.0);
  static const horizontalPadding16 = EdgeInsets.symmetric(horizontal: 16.0);
  static const horizontalPadding22 = EdgeInsets.symmetric(horizontal: 20.0);
  static const horizontalPadding20 = EdgeInsets.symmetric(horizontal: 22.0);
  static const horizontalPadding24 = EdgeInsets.symmetric(horizontal: 24.0);
  static const horizontalPadding44 = EdgeInsets.symmetric(horizontal: 44.0);
  static const horizontalPadding48 = EdgeInsets.symmetric(horizontal: 48.0);

  static const paddingV2H8 =
      EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0);
  static const paddingV4H16 =
      EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0);
  static const paddingV6H14 =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0);
  static const paddingV6H22 =
      EdgeInsets.symmetric(vertical: 6.0, horizontal: 22.0);
  static const paddingV8H12 =
      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0);
  static const paddingV8H16 =
      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
  static const paddingV8H32 =
      EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0);
  static const paddingV12H8 =
      EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0);
  static const paddingV12H22 =
      EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0);
  static const paddingV16H22 =
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 22.0);
  static const paddingV12H16 =
      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0);
  static const paddingV16H24 =
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0);
  static const paddingV24H12 =
      EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0);
  static const paddingV16H12 =
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0);
  static const paddingV4H12 =
      EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0);
  static const paddingV24H22 =
      EdgeInsets.symmetric(vertical: 24.0, horizontal: 22.0);
  static const paddingV16H8 =
      EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0);
  static const paddingV60H16 =
      EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0);
  static const paddingV24H44 =
      EdgeInsets.symmetric(vertical: 24.0, horizontal: 44.0);

  static const roundCorner4 = Radius.circular(4.0);

  // animation duration
  static const defaultAnimationDuration = Duration(milliseconds: 500);
  static const fastAnimationDuration = Duration(milliseconds: 300);
}
