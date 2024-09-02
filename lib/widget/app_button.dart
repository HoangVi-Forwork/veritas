// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:veritas/resource/resource.dart';

import '../utils/grainy_painter.dart';

class VtsConfirmButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final bool enable;
  final double? textStyle;
  final Color? backgroudColor;
  final Color? textColor;
  final Color? sideColor;
  final EdgeInsets? padding;
  final double? width;
  final double? hight;
  final double? minimumWidth;

  const VtsConfirmButton({
    super.key,
    this.onTap,
    this.title,
    this.enable = true,
    this.textStyle,
    this.backgroudColor,
    this.textColor,
    this.sideColor,
    this.padding,
    this.width,
    this.hight,
    this.minimumWidth,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = enable ? onTap : null;
    return GrainyContainer(
      color: backgroudColor ?? VtsColors.primaryColor,
      width: minimumWidth,
      child: SizedBox(
        width: width ?? double.infinity,
        height: hight ?? VtsDimens.w50 + 2,
        child: TextButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            title ?? '',
            style: TextStyle(
              fontSize: textStyle ?? 16,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class VtsTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final bool enable;
  final double? textSize;
  final HexColor? backgroudColor;
  final HexColor? textColor;
  final HexColor? sideColor;
  final EdgeInsets? padding;
  final double? width;
  final double? hight;
  final double? minimumWidth;
  final FontStyle? fontStyle;
  final Alignment? alignment;

  const VtsTextButton({
    super.key,
    this.onTap,
    this.title,
    this.enable = true,
    this.textSize,
    this.backgroudColor,
    this.textColor,
    this.sideColor,
    this.padding,
    this.width,
    this.hight,
    this.minimumWidth,
    this.fontStyle,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = enable ? onTap : null;
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
      ),
      child: Align(
        alignment: alignment ?? Alignment.centerLeft,
        child: Text(
          title ?? '',
          style: TextStyle(
            fontSize: textSize ?? 16,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
