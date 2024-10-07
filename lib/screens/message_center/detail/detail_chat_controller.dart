import 'package:get/get.dart';

class VtsDetailChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VtsDetailChatController());
  }
}

class VtsDetailChatController extends GetxController {
  // region: Define Value
  String? chatId = '';
  String? username = '';
  String? userImage = '';
  String? chatContent = '';

  final isVisibleTime = false.obs;
  // endregion


  @override
  void onInit() {
    super.onInit();
    setupArguments();
  }

  void setupArguments() {
    final arguments = Get.arguments as Map<String?, dynamic>;
    chatId = arguments['chatId'] ?? '';
    username = arguments['username'] ?? '';
    userImage = arguments['userImage'] ?? '';
    chatContent = arguments['chatContent'] ?? '';
  }
}