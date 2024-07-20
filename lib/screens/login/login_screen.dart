import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:veritas/resource/resource.dart';
import 'package:veritas/resource/vts_styles.dart';
import '../../utils/grainy_painter.dart';
import '../../utils/ui_utils.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset(
            VtsDrawable.appLogo,
            width: VtsDimens.w50 + 2,
            height: VtsDimens.w50 + 2,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Expanded(
                child: Image.asset(
                  VtsDrawable.appBackgroundCloud,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(VtsDimens.w25 - 1),
              child: SafeArea(
                child: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                    return SingleChildScrollView(
                      reverse: isKeyboardVisible,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: VtsDimens.w300,
                          ),
                          GrainyContainer(
                            width: 400,
                            height: 400,
                            color: VtsColors.primaryColor,
                            alignment: Alignment.topLeft,
                            padding: VtsDimens.w20 - 6,
                            child: Column(
                              children: [
                                UiUtil.verticalSpace12,
                                Text(
                                  "Welcome back!",
                                  style: VtsTextStyle.textStyleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: VtsColors.textLightColor,
                                  ),
                                ),
                                Text(
                                  "We're so excited to see you agin!",
                                  style: VtsTextStyle.textStyleSmall.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                  ),
                                ),
                                UiUtil.verticalSpace24,
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Account Information",
                                    style: VtsTextStyle.textStyleSmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                UiUtil.verticalSpace12,
                                AppTextField(
                                  onChanged: (value) {},
                                  placeholderTextColor:
                                      VtsColors.textLightColor,
                                  placeholder:
                                      "Enter your Email or Nunber Phone",
                                  enabled: true,
                                  expands: false,
                                  autoFocus: true,
                                  keyboardType: TextInputType.text,
                                  isRequired: true,
                                  showClearButton: false,
                                ),
                                UiUtil.verticalSpace12,
                                AppTextField(
                                  onChanged: (value) {},
                                  placeholderTextColor:
                                      VtsColors.textLightColor,
                                  placeholder: "Password",
                                  enabled: true,
                                  expands: false,
                                  autoFocus: true,
                                  keyboardType: TextInputType.text,
                                  isRequired: true,
                                  showClearButton: false,
                                  textColor: VtsColors.textLightColor,
                                ),
                                UiUtil.verticalSpace8,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VtsTextButton(
                                      onTap: () {},
                                      title: 'Forgot password?',
                                      textSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    VtsTextButton(
                                      onTap: () {},
                                      title: 'Or Register?',
                                      textSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          UiUtil.verticalSpace12,
                          const VtsConfirmButton(
                            title: 'Login',
                          ),
                          UiUtil.verticalSpace40,
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
