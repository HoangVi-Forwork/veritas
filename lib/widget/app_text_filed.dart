import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veritas/resource/resource.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final bool? secured;
  final Color? textColor;
  final double? textFontSize;
  final Color? fillColor;
  final Color? errorTextColor;
  final Color? placeholderTextColor;
  final Color? focusBorderColor;
  final Color? normalBorderColor;
  final VoidCallback? onClear;
  final ValueChanged<String>? onChanged;
  final Function(String)? onSubmitted;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool isRequired;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialText;
  final double? borderSize;
  final BorderStyle? borderStyle;
  final bool expands;
  final Color? cursorColor;
  final bool showClearButton;
  final bool enabled;
  final FocusNode? focusNode;
  final VoidCallback? onPrefixIconClick;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final InputDecoration? decoration;
  final double? borderRadius;
  final bool isCheckValid;

  const AppTextField({
    super.key,
    this.controller,
    this.placeholder,
    this.secured,
    this.textColor,
    this.textFontSize,
    this.fillColor,
    this.errorTextColor,
    this.placeholderTextColor,
    this.focusBorderColor,
    this.normalBorderColor,
    this.onClear,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    required this.isRequired,
    required this.autoFocus,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.initialText,
    this.borderSize,
    this.borderStyle,
    required this.expands,
    this.cursorColor,
    required this.showClearButton,
    required this.enabled,
    this.focusNode,
    this.onPrefixIconClick,
    this.textStyle,
    this.textAlign,
    this.decoration,
    this.borderRadius,
    this.isCheckValid = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController? _controller;
  var _isShowClear = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    final widgetInitialText = widget.initialText ?? '';
    _controller?.text = widgetInitialText;
    _isShowClear = widgetInitialText.isNotEmpty && widget.enabled;
  }

  bool _isEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  bool _isNumric(String phone) {
    return double.tryParse(phone) != null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      textAlign: widget.textAlign ?? TextAlign.left,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      cursorColor: widget.cursorColor ?? VtsColors.whileColors,
      expands: widget.expands,
      minLines: widget.minLines,
      controller: _controller,
      autofocus: widget.autoFocus,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      onChanged: (text) {
        if (widget.showClearButton) {
          _isShowClear = text.isNotEmpty;
        }

        widget.onChanged?.call(text);
        setState(() {});
      },
      // onSubmitted: widget.onSubmitted,
      validator: (value) {
        if (widget.isCheckValid) {
          if (value == null || value.isEmpty) {
            return 'Vui lòng điền đầy đủ thông tin';
          } else if (!widget.isRequired && !_isEmail(value)) {
            return 'Vui lòng nhập email hợp lệ';
          } else if (_isNumric(value)) {
            if (value.length < 10 || value.length > 10) {
              return 'Vui lòng nhập số điện thoại hợp lệ';
            }
          }
        }
        return null;
      },
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      obscureText: widget.secured ?? false,
      enableSuggestions: false,
      style: widget.textStyle?.copyWith(
            color: widget.textColor ??
                VtsColors.textLightColor, // Thay đổi màu chữ ở đây
          ) ??
          TextStyle(
            color: widget.textColor ?? VtsColors.textLightColor,
            fontSize: widget.textFontSize,
          ),
      decoration: InputDecoration(
        counterText: '',
        contentPadding: const EdgeInsets.only(
          left: VtsDimens.w15 - 3,
          right: VtsDimens.w15 - 3,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.borderRadius ?? VtsDimens.corner),
          borderSide: BorderSide(color: widget.focusBorderColor ?? Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.borderRadius ?? VtsDimens.corner),
          borderSide: BorderSide(
              color: widget.normalBorderColor ?? VtsColors.whileColors),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.borderRadius ?? VtsDimens.corner),
          borderSide: BorderSide(
              color: widget.normalBorderColor ?? VtsColors.whileColors),
        ),
        prefixIcon: widget.onPrefixIconClick != null
            ? InkWell(
                onTap: widget.onPrefixIconClick,
                child: widget.prefixIcon,
              )
            : widget.prefixIcon,
        suffixIcon: widget.showClearButton
            ? _isShowClear
                ? InkWell(
                    onTap: () {
                      _controller?.clear();
                      widget.onClear?.call();
                      setState(() => _isShowClear = false);
                    },
                    child: Icon(
                      Icons.cancel_sharp,
                      size: VtsDimens.textButtonPayment,
                      color: VtsColors.whileColors,
                    ),
                  )
                : null
            : widget.suffixIcon,
        fillColor: Colors.transparent,
        filled: true,
        errorText: widget.errorText,
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          fontSize: widget.textFontSize ?? VtsDimens.textSmall - 2,
          color: widget.placeholderTextColor ?? Colors.grey,
        ),
      ),
    );
  }
}
