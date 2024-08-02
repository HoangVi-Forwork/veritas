// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:veritas/resource/resource.dart';
import 'package:veritas/resource/vts_styles.dart';
import 'package:veritas/screens/login/authen_controler.dart';
import '../../utils/grainy_painter.dart';
import '../../utils/ui_utils.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _controller = Get.find<AuthenController>();

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
            _buildBackgroudImage(),
            Padding(
              padding: const EdgeInsets.all(VtsDimens.w25 - 1),
              child: SafeArea(
                child: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                    return SingleChildScrollView(
                      reverse: isKeyboardVisible,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: VtsDimens.w300,
                            ),
                            GrainyContainer(
                              width: 400,
                              height: _controller.isRegisterScreen == false
                                  ? 400
                                  : 500,
                              color: _controller.isRegisterScreen == false
                                  ? VtsColors.primaryColor
                                  : VtsColors.deepGreenColor,
                              alignment: Alignment.topLeft,
                              padding: VtsDimens.w20 - 6,
                              child: Obx(
                                () => Column(
                                  children: [
                                    UiUtil.verticalSpace12,
                                    Text(
                                      _controller.isRegisterScreen != true
                                          ? "Welcome back!"
                                          : 'Register account',
                                      style:
                                          VtsTextStyle.textStyleMedium.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: VtsColors.textLightColor,
                                      ),
                                    ),
                                    Text(
                                      _controller.isRegisterScreen != true
                                          ? "We're so excited to see you agin!"
                                          : "Exciting experiences are waiting for you ahead!",
                                      style:
                                          VtsTextStyle.textStyleSmall.copyWith(
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
                                        style: VtsTextStyle.textStyleSmall
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    if (_controller.isRegisterScreen ==
                                        true) ...[
                                      UiUtil.verticalSpace12,
                                      AppTextField(
                                        onChanged: (value) {},
                                        placeholderTextColor:
                                            VtsColors.textLightColor,
                                        placeholder: "Username",
                                        enabled: true,
                                        expands: false,
                                        autoFocus: true,
                                        keyboardType: TextInputType.text,
                                        isRequired: true,
                                        showClearButton: false,
                                      ),
                                    ],
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
                                      isCheckValid: true,
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
                                      isCheckValid: true,
                                      maxLines: 1,
                                      secured: true,
                                    ),
                                    UiUtil.verticalSpace12,
                                    if (_controller.isRegisterScreen ==
                                        true) ...[
                                      AppTextField(
                                        onChanged: (value) {},
                                        placeholderTextColor:
                                            VtsColors.textLightColor,
                                        placeholder: "Confirm Password",
                                        enabled: true,
                                        expands: false,
                                        autoFocus: true,
                                        keyboardType: TextInputType.text,
                                        isRequired: true,
                                        showClearButton: false,
                                        textColor: VtsColors.textLightColor,
                                        isCheckValid: true,
                                        maxLines: 1,
                                        secured: true,
                                      ),
                                      UiUtil.verticalSpace8,
                                      Obx(
                                        () => _buildAgreeCheckBox(),
                                      ),
                                      UiUtil.verticalSpace8,
                                    ],
                                    _buildForgotOrRegisterRowButton()
                                  ],
                                ),
                              ),
                            ),
                            UiUtil.verticalSpace12,
                            VtsConfirmButton(
                              title: _controller.isRegisterScreen != true
                                  ? 'Login'
                                  : 'Register',
                              onTap: _controller.isRegisterScreen != true
                                  ? _controller.loginConfirm
                                  : null,
                              backgroudColor:
                                  _controller.isRegisterScreen != true
                                      ? VtsColors.primaryColor
                                      : VtsColors.deepGreenColor,
                            ),
                            UiUtil.verticalSpace40,
                          ],
                        ),
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

  CheckboxListTile _buildAgreeCheckBox() {
    return CheckboxListTile(
      title: RichText(
        text: TextSpan(
          text: 'I agree to',
          style: VtsTextStyle.textStyleSmall.copyWith(
            color: VtsColors.textLightColor,
            fontStyle: FontStyle.italic,
          ),
          children: [
            TextSpan(
              text: ' the term.',
              style: VtsTextStyle.textStyleSmall.copyWith(
                color: VtsColors.textLightColor,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: VtsColors.deepGreenColor,
      fillColor: MaterialStateProperty.all(
        VtsColors.whileColors,
      ),
      value: _controller.isCheckBoxConfirmInfo == true,
      onChanged: (val) {},
    );
  }

  Positioned _buildBackgroudImage() {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Expanded(
        child: Obx(
          () => Image.asset(
            _controller.isRegisterScreen != true
                ? VtsDrawable.appBackgroundCloud
                : VtsDrawable.appBackgroundRain,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Visibility _buildForgotOrRegisterRowButton() {
    return Visibility(
      visible: _controller.isRegisterScreen != true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VtsTextButton(
            onTap: () {},
            title: 'Forgot password?',
            textSize: 12,
            fontStyle: FontStyle.italic,
          ),
          VtsTextButton(
            onTap: _controller.navigateToRegistrationScreen,
            title: 'Or Register?',
            textSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ],
      ),
    );
  }
}
