import 'package:get/get.dart';

class MessageCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageCenterController());
  }
}

class MessageCenterController extends GetxController {}
