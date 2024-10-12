import 'package:get/get.dart';

class VeritasFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VeritasFeedController());
  }
}

class VeritasFeedController extends GetxController {
  var isCommentPanelVisible = false.obs;

  void toggleCommentPanel() {
    isCommentPanelVisible.value = !isCommentPanelVisible.value;
  }

  void hideCommentPanel() {
    isCommentPanelVisible.value = false;
  }
}
