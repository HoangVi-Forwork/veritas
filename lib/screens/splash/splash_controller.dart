import 'package:get/get.dart';
import 'package:veritas/utils/network_utils.dart';
import 'package:veritas/utils/ui_utils.dart';

import '../../router/app_route.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}

class SplashScreenController extends GetxController {
  SplashScreenController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    final isOnline = await NetworkUtil.getInstance().isOnline;

    if (isOnline) {
      UiUtil.showHUBLoading();
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed(VtsRoute.ROUTE_LOGIN_SCREEN);
      });
    } else {
      UiUtil.showToast('No Connected to Internet');
    }
  }
}
