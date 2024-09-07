import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';
import 'package:veritas/resource/vts_colors.dart';
import 'package:veritas/resource/vts_styles.dart';
import 'package:veritas/utils/ui_utils.dart';
import '../../../utils/vts_app_log.dart';
import 'detail_chat_controller.dart';

class VtsDetailChatScreen extends StatelessWidget {
  const VtsDetailChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VtsDetailChatController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white70,
      appBar: _detailChatAppBar(controller),
      body: _buildBody(controller),
    );
  }

  Widget _buildBody(VtsDetailChatController controller) {
    return Stack(children: [
      _bodyContent(controller),
      _buildInputText(),
    ]);
  }

  Align _buildInputText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
          width: double.infinity,
          color: Colors.white38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    Icons.insert_emoticon_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
              UiUtil.horizontalSpace8,
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Message...",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 15),
                    counterStyle:
                        TextStyle(color: VtsColors.primaryColor, fontSize: 15),
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              UiUtil.horizontalSpace8,
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.grey,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.grey,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String? id, String? message) {
    const myID = '0000';
    return Align(
      alignment: id != myID ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: id != myID ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: const BoxConstraints(maxWidth: 250),
        child: Text(
          message ?? '',
          style: TextStyle(
            color: id != myID ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _bodyContent(VtsDetailChatController controller) {
    const myID = '*';
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Align(
        alignment: controller.chatId != myID ? Alignment.topLeft : Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: GestureDetector(
            onTap: () {
              controller.isVisibleTime.value = true;
              // check Log
              VtsAppLog.info(
                  'isVisibleTime', '${controller.isVisibleTime.value}');
            },
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 50.0, maxWidth: 300.0, minHeight: 50.0),
              child: IntrinsicWidth(
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [VtsColors.primaryColor, Colors.blueGrey],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '${controller.chatContent}',
                            style: VtsTextStyle.textStyleNormal.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                () => Visibility(
                                  visible: controller.isVisibleTime.value == true,
                                  child: Text(
                                    '16:01',
                                    style: VtsTextStyle.textStyleNormal.copyWith(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                ),
                              ),
                              UiUtil.horizontalSpace4,
                              const Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _detailChatAppBar(VtsDetailChatController controller) {
    return AppBar(
      leadingWidth: 42,
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                controller.userImage ?? '',
              ),
            ),
          ),
          UiUtil.horizontalSpace8,
          Text(
            '${controller.username}',
            style: VtsTextStyle.textStyleMedium.copyWith(color: Colors.white),
          ),
        ],
      ),
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 18,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
