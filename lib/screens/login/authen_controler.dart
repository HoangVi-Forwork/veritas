import 'package:get/get.dart';

import '../../router/app_route.dart';

class AuthenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenController());
  }
}

class AuthenController extends GetxController {
  final isRegisterScreen = false.obs;
  final isCheckBoxConfirmInfo = true.obs;

  @override
  void onInit() {
    super.onInit();
    isRegisterScreen.value = false;
    isCheckBoxConfirmInfo.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    isRegisterScreen.value = false;
    isCheckBoxConfirmInfo.value = false;
  }

  void navigateToLoginScreen() {
    Get.toNamed(VtsRoute.ROUTE_LOGIN_SCREEN);
  }

  void loginConfirm() {
    navigateToLandingScreen();
  }

  void navigateToLandingScreen() {
    Get.offNamed(VtsRoute.ROUTE_LANDING_SCREEN);
  }

  void navigateToRegistrationScreen() {
    isRegisterScreen.value = true;
    isCheckBoxConfirmInfo.value = true;
    Get.toNamed(VtsRoute.ROUTE_REGISTRAION_SCREEN);
  }
}
