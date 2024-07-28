import 'dart:math';
import 'package:flutter/material.dart';
import 'package:veritas/resource/resource.dart';

class GrainyPainter extends CustomPainter {
  final Color grainColor;
  final double grainOpacity;
  final int grainCount;

  GrainyPainter({
    required this.grainColor,
    this.grainOpacity = 0.1,
    this.grainCount = 1000,
  });

  final Random random = Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = grainColor.withOpacity(grainOpacity)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < grainCount; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class GrainyContainer extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;
  final double? padding;
  final double? margin;
  final Alignment? alignment;
  final BoxDecoration? decoration;
  final Widget? child;

  const GrainyContainer({
    super.key,
    this.color,
    this.width = VtsDimens.w300 + VtsDimens.w100,
    this.height = VtsDimens.w50 - 2,
    this.padding,
    this.margin,
    this.alignment = Alignment.topLeft,
    this.decoration,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? 0),
      margin: EdgeInsets.all(margin ?? 0),
      alignment: alignment ?? Alignment.topLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 3, 3, 3).withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      child: CustomPaint(
        painter: GrainyPainter(grainColor: Colors.white),
        child: child,
      ),
    );
  }
}
