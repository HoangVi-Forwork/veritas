import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/vts_styles.dart';
import 'package:veritas/utils/ui_utils.dart';

import '../../resource/vts_drawable.dart';
import 'veritas_feed_controller.dart';

class VeritasFeedScreen extends StatelessWidget {
  const VeritasFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VeritasFeedController veritasFeedController =
        Get.find<VeritasFeedController>();

    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/564x/be/85/17/be8517b6c349be1eac892a436b0580f9.jpg'),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => _showCommentSheet(
                                    context), // Kích hoạt panel
                                child: SvgPicture.asset(
                                  VtsDrawable.commentIcon,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              UiUtil.verticalSpace22,
                              SvgPicture.asset(
                                VtsDrawable.heardIcon,
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        UiUtil.horizontalSpace10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiUtil.verticalSpace8,
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \nSed lobortis est ac quam convallis, in pellentesque ligula sagittis. Donec vitae lobortis felis. \nIn tincidunt velit euismod, euismod neque eu, ullamcorper nunc. Nulla facilisi. \nMaecenas euismod, lectus in condimentum congue.'),
                                    UiUtil.verticalSpace8,
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      child: Image.network(
                                        'https://i.pinimg.com/564x/2f/7f/13/2f7f13f92280dc16e859990eebede70b.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showCommentSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Comments (12)', style: VtsTextStyle.textStyleNormal),
                IconButton(
                  iconSize: 14,
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/be/85/17/be8517b6c349be1eac892a436b0580f9.jpg',
                      ),
                    ),
                    title: Text('User ${index + 1}',
                        style: VtsTextStyle.textStyleSmall),
                    subtitle: Text('This is a comment.',
                        style: VtsTextStyle.textStyleSmall),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
