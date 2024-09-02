import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';
import 'package:veritas/resource/vts_styles.dart';
import 'package:veritas/utils/ui_utils.dart';
import 'message_center_controller.dart';

class MessageCenterScreen extends StatelessWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MessageCenterController controller =
        Get.find<MessageCenterController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _messageScreenAppBar(),
        body: TabBarView(
          children: [
            _chatTabScrollView(controller),
            _groupChatTabScrollView(controller)
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _chatTabScrollView(MessageCenterController controller) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Obx(
        () {
          if (controller.chatDataList.isEmpty) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Text('May ko co thang ban nao het!'),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: List.generate(
              controller.chatDataList.length,
              (index) {
                final chatInfo = controller.chatDataList[index];
                return GestureDetector(
                  onTap: () {
                    // navigate to ChatScreen
                  },
                  onLongPress: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('Chat Overview'),
                        content: const SizedBox(
                          width: 250,
                          height: 300,
                          child: Text('Overview Content ...'),
                        ),
                        backgroundColor: VtsColors.whileColors,
                        surfaceTintColor: Colors.white54,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white12,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              chatInfo.userImage ??
                                  'https://i.pinimg.com/736x/3d/f4/d6/3df4d6bb8a2bf4b1dc4c3c79699c29a1.jpg',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                top: 16, bottom: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getFormattedOverflowText(
                                        chatInfo.username ??
                                            'Nguoi dung Veritas',
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: VtsTextStyle.textStyleSmall
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                    ),
                                    UiUtil.horizontalSpace4,
                                    Text(
                                      '01:18',
                                      style: VtsTextStyle.textStyleSmall
                                          .copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                                UiUtil.verticalSpace4,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getFormattedOverflowText(
                                          chatInfo.chatDescription ?? ''),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          VtsTextStyle.textStyleSmall.copyWith(
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    UiUtil.horizontalSpace4,
                                    Icon(
                                      Icons.done_rounded,
                                      color: VtsColors.deepGreenColor,
                                      weight: 10,
                                      size: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  SingleChildScrollView _groupChatTabScrollView(
      MessageCenterController controller) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Obx(() => Column(
            children: List.generate(
              controller.groupChatDataList.length,
              (index) {
                var groupChatInfo = controller.groupChatDataList[index];
                return Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.white12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(groupChatInfo
                                  .userImage ??
                              'https://i.pinimg.com/736x/3d/f4/d6/3df4d6bb8a2bf4b1dc4c3c79699c29a1.jpg'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getFormattedOverflowText(
                                  groupChatInfo.username ?? ''),
                              style: VtsTextStyle.textStyleSmall.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            UiUtil.verticalSpace4,
                            Text(
                              getFormattedOverflowText(
                                  groupChatInfo.chatDescription ?? ''),
                              textAlign: TextAlign.start,
                              style: VtsTextStyle.textStyleSmall.copyWith(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }

  AppBar _messageScreenAppBar() {
    return AppBar(
      title: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.white,
        tabs: [
          Tab(
              child: Text(
            'Chat',
            style: VtsTextStyle.textStyleSmall
                .copyWith(color: VtsColors.textLightColor),
          )),
          Tab(
              child: Text(
            'Groups',
            style: VtsTextStyle.textStyleSmall
                .copyWith(color: VtsColors.textLightColor),
          )),
        ],
      ),
    );
  }

  String getFormattedOverflowText(String text) {
    if (text.length <= 40) {
      return text;
    } else {
      return '${text.substring(0, 40)}...';
    }
  }
}
