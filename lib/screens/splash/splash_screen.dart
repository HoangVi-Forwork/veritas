// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veritas/screens/splash/splash_controller.dart';
import '../../resource/resource.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final _controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: VtsDimens.w125,
              height: VtsDimens.w125,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    color: Color.fromARGB(225, 195, 202, 220),
                  )
                ],
              ),
              child: Image.asset(
                VtsDrawable.appLogo,
                width: VtsDimens.w125 - 5,
                height: VtsDimens.w125 - 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
