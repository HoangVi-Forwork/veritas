import 'package:get/get.dart';

class VeritasFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VeritasFeedController());
  }
}

class VeritasFeedController extends GetxController {}
