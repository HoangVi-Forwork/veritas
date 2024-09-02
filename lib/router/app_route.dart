// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import '../screens/splash/splash_screen.dart';
import 'package:veritas/screens/landing/landing_controller.dart';
import 'package:veritas/screens/login/login_screen.dart';
import '../screens/landing/landing.dart';
import '../screens/login/authen_controler.dart';
import '../screens/message_center/message_center.dart';
import '../screens/splash/splash.dart';

class VtsRoute {
  VtsRoute._();
  
  // DEFINE APP ROUTE
  static const String ROUTE_SPLASH_SCREEN = '/ROUTE_SPLASH_SCREEN';
  static const String ROUTE_LOGIN_SCREEN = '/ROUTE_LOGIN_SCREEN';
  static const String ROUTE_REGISTRAION_SCREEN = '/ROUTE_REGISTRAION_SCREEN';
  static const String ROUTE_LANDING_SCREEN = '/ROUTE_LANDING_SCREEN';
  static const String ROUTE_MESSAGE_CENTER_SCREEN =
      '/ROUTE_MESSAGE_CENTER_SCREEN';
}

// GET PAGE WITH ROUTE
final pages = [
  GetPage(
    name: VtsRoute.ROUTE_SPLASH_SCREEN,
    page: () => SplashScreen(),
    bindings: [
      SplashScreenBinding(),
    ],
    transition: Transition.fade,
  ),
  GetPage(
    name: VtsRoute.ROUTE_LOGIN_SCREEN,
    page: () => LoginScreen(),
    bindings: [
      AuthenBinding(),
    ],
    transition: Transition.fade,
  ),
  GetPage(
    name: VtsRoute.ROUTE_REGISTRAION_SCREEN,
    page: () => LoginScreen(),
    bindings: [
      AuthenBinding(),
    ],
    transition: Transition.fade,
  ),
  GetPage(
    name: VtsRoute.ROUTE_LANDING_SCREEN,
    page: () => const LandingScreen(),
    bindings: [
      LandingBinding(),
      MessageCenterBinding(),
    ],
    transition: Transition.fade,
  ),
  GetPage(
    name: VtsRoute.ROUTE_MESSAGE_CENTER_SCREEN,
    page: () => const MessageCenterScreen(),
    bindings: [
      MessageCenterBinding(),
    ],
    transition: Transition.fade,
  ),
];
