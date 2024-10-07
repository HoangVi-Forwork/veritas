import 'package:get/get.dart';
import 'package:veritas/module/chat_info.dart';

import '../../module/mock_data/mock_chat_data.dart';

class MessageCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageCenterController());
  }
}

class MessageCenterController extends GetxController {
  // Define variables
  var chatDataList = <ChatInfo>[].obs;
  var groupChatDataList = <ChatInfo>[].obs;
  //

  @override
  void onInit() {
    super.onInit();
    generateChatList();
    generateGroupList();
  }

  @override
  void dispose() {
    super.dispose();
    chatDataList.clear();
    groupChatDataList.clear();
  }

  void generateChatList() {
    chatDataList.assignAll(MockChatData.getChatInfoList());
  }

  void generateGroupList() {
    groupChatDataList.assignAll(MockChatData.getGroupChatList());
  }
}
