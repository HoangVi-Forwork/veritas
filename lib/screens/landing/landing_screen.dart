import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';
import 'package:veritas/screens/veritas_feed/veritas_feed_screen.dart';
import 'package:veritas/utils/ui_utils.dart';

import '../../resource/vts_styles.dart';
import '../message_center/message_center_screen.dart';
import 'landing_controller.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingController landingController = Get.put(LandingController());

    final List<String> titles = [
      'Message Center',
      'News \n(01)',
      'Search \n(02)',
      'Person \n(03)',
    ];

    final List<Widget> pages = [
      const MessageCenterScreen(),
      const VeritasFeedScreen(),
      const Center(
        child: Text('Undeveloped feature \n(02)', textAlign: TextAlign.center),
      ),
      const Center(
        child: Text('Undeveloped feature \n(03)', textAlign: TextAlign.center),
      ),
    ];

    return Scaffold(
      backgroundColor: VtsColors.backgroundLightColor.withOpacity(0.8),
      appBar: landingAppBar(landingController, titles),
      body: landingBody(landingController, pages),
    );
  }

  AppBar landingAppBar(
      LandingController landingController, List<String> titles) {
    return AppBar(
      backgroundColor: VtsColors.primaryColor,
      title: Obx(() {
        if (landingController.selectedIndex.value == 0) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  VtsDrawable.icGridLine,
                  color: Colors.white,
                  width: 16,
                  height: 16,
                ),
              ),
              Text(
                titles[landingController.selectedIndex.value],
                textAlign: TextAlign.center,
                style: VtsTextStyle.textStyleSmall.copyWith(
                  color: VtsColors.textLightColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  VtsDrawable.icSearchLine,
                  color: Colors.white,
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          );
        } else if (landingController.selectedIndex.value == 1) {
          return GestureDetector(
            onTap: () {
              Get.bottomSheet(
                showAddPostWidget(),
                isScrollControlled: true,
              );
            },
            child: Image.asset(
              VtsDrawable.appLogo,
              width: VtsDimens.w50 + 2,
              height: VtsDimens.w50 - 2,
            ),
          );
        } else if (landingController.selectedIndex.value == 2) {
          return Text(
            titles[landingController.selectedIndex.value],
            textAlign: TextAlign.center,
            style: VtsTextStyle.textStyleSmall.copyWith(
              color: VtsColors.textLightColor,
              fontWeight: FontWeight.bold,
            ),
          );
        } else if (landingController.selectedIndex.value == 3) {
          return Text(
            titles[landingController.selectedIndex.value],
            textAlign: TextAlign.center,
            style: VtsTextStyle.textStyleSmall.copyWith(
              color: VtsColors.textLightColor,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return Image.asset(
          VtsDrawable.appLogo,
          width: VtsDimens.w50 + 2,
          height: VtsDimens.w50 + 2,
        );
      }),
      centerTitle: true,
    );
  }

  Container showAddPostWidget() {
    return Container(
      constraints: const BoxConstraints(minHeight: 400),
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/564x/be/85/17/be8517b6c349be1eac892a436b0580f9.jpg'),
                      ),
                      UiUtil.horizontalSpace10,
                      Text(
                        'Public',
                        style: VtsTextStyle.textStyleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset(
                  VtsDrawable.icSendPlaneLine,
                  color: Colors.white,
                )
              ],
            ),
          ),
          UiUtil.verticalSpace10,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'What\'s \non your mind?',
                hintStyle: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          UiUtil.verticalSpace10,
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 48,
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.comment,
                    size: 16,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Mọi người có thể bình luận bài viết này?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          UiUtil.verticalSpace10,
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.abc),
                UiUtil.horizontalSpace12,
                Icon(Icons.image),
                UiUtil.horizontalSpace12,
                Icon(Icons.location_on),
                UiUtil.horizontalSpace12,
                Icon(Icons.gif),
              ],
            ),
          )
        ],
      ),
    );
  }
  // endregion

  Stack landingBody(LandingController landingController, List<Widget> pages) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            landingController.onScroll(notification);
            return true;
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Obx(
                  () => pages[landingController.selectedIndex.value],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: Obx(() {
            return AnimatedOpacity(
              opacity: landingController.isScrollingUp.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: VtsDimens.heighOfButton56,
                  margin: const EdgeInsets.only(
                    left: VtsDimens.margin30 + 6,
                    right: VtsDimens.margin30 + 6,
                  ),
                  decoration: BoxDecoration(
                    color: VtsColors.primaryColor,
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) {
                        String? icon;
                        switch (index) {
                          case 0:
                            icon = VtsDrawable.icChat3Line;
                            break;
                          case 1:
                            icon = VtsDrawable.icGlobe2Line;
                            break;
                          case 2:
                            icon = VtsDrawable.icSearchLine;
                            break;
                          case 3:
                            icon = VtsDrawable.icUser1Line;
                            break;
                          default:
                            icon = VtsDrawable.icGlobe2Line;
                            break;
                        }
                        var isSelectPage =
                            index == landingController.selectedIndex.value;
                        return GestureDetector(
                          onTap: () => landingController.changePage(index),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  icon,
                                  color:
                                      isSelectPage ? Colors.white : Colors.grey,
                                ),
                                UiUtil.verticalSpace2,
                                if (isSelectPage)
                                  Container(
                                    width: 6,
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                              ]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        // Todo: later development
        /*Positioned(
          right: VtsDimens.margin16,
          bottom: VtsDimens.margin16 +
              VtsDimens.heighOfButton56 +
              16, // Offset by the height of the bottom navigation bar
          child: Obx(() {
            return AnimatedOpacity(
              opacity: landingController.isScrollingUp.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                onPressed: () {
                  //Todo: Handle FloatingActionButton press
                },
                child: Icon(Icons.add),
              ),
            );
          }),
        ),*/
      ],
    );
  }
}
