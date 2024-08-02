import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingController());
  }
}

class LandingController extends GetxController {
  var selectedIndex = 0.obs;
  var isScrollingUp = true.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void onScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (notification.scrollDelta! > 0) {
        isScrollingUp.value = false; // Đang cuộn xuống
      } else {
        isScrollingUp.value = true; // Đang cuộn lên
      }
    }
  }
}
