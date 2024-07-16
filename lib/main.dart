import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'resource/vts_lang.dart';
import 'resource/vts_styles.dart';
import 'router/app_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: VtsLanguage.appName,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialRoute: ROUTE_SPLASH_SCREEN,
    );
  }
}
