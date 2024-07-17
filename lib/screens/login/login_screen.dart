import 'package:flutter/material.dart';
import 'package:veritas/resource/resource.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: VtsColors.backgroundLightColor,
        title: Image.asset(
          VtsDrawable.appLogo,
          width: 52,
          height: 52,
        ),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('LoginScreen'),
          )
        ],
      ),
    );
  }
}
