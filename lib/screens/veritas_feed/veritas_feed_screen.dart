import 'package:flutter/material.dart';
import 'package:veritas/utils/ui_utils.dart';

class VeritasFeedScreen extends StatelessWidget {
  const VeritasFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.heart_broken_outlined,
                            color: Colors.grey,
                          ),
                          UiUtil.verticalSpace22,
                          Icon(
                            Icons.comment_outlined,
                            color: Colors.grey,
                          ),
                          UiUtil.verticalSpace22,
                          Icon(
                            Icons.book,
                            color: Colors.grey,
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
    );
  }
}
