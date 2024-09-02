import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';

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
      const Center(
        child: Text(
          'Undeveloped feature \n(01)',
          textAlign: TextAlign.center,
        ),
      ),
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
      title: Obx(
        () => landingController.selectedIndex.value == 1
            ? Image.asset(
                VtsDrawable.appLogo,
                width: VtsDimens.w50 + 2,
                height: VtsDimens.w50 + 2,
              )
            : Text(
                titles[landingController.selectedIndex.value],
                textAlign: TextAlign.center,
                style: VtsTextStyle.textStyleSmall.copyWith(
                  color: VtsColors.textLightColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      centerTitle: true,
    );
  }

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
          bottom: 8,
          child: Obx(() {
            return AnimatedOpacity(
              opacity: landingController.isScrollingUp.value ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: VtsDimens.heighOfButton56,
                  decoration: BoxDecoration(
                    color: VtsColors.primaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) {
                        IconData icon;
                        switch (index) {
                          case 0:
                            icon = Icons.message;
                            break;
                          case 1:
                            icon = Icons.newspaper;
                            break;
                          case 2:
                            icon = Icons.search;
                            break;
                          case 3:
                            icon = Icons.person;
                            break;
                          default:
                            icon = Icons.star;
                            break;
                        }
                        return IconButton(
                          icon: Icon(icon),
                          color: landingController.selectedIndex.value == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          onPressed: () => landingController.changePage(index),
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
        /* Positioned(
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
