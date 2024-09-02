// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../resource/resource.dart';

class BaseScaffold extends StatelessWidget {
  BaseScaffold({
    super.key,
    this.child,
    this.isHaveFloatingActionButton = false,
  });

  Widget? child;
  bool isHaveFloatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          VtsDrawable.appLogo,
          width: VtsDimens.w50 + 2,
          height: VtsDimens.w50 + 2,
        ),
        centerTitle: true,
      ),
      // body: child,
      bottomNavigationBar: Container(
        color: VtsColors.backgroundDarkColor,
      ),
      floatingActionButton: isHaveFloatingActionButton == true
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
