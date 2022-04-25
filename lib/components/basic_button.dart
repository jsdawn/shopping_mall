import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.primary,
    this.backgroundColor,
    this.side,
    this.textStyle,
    this.size = BasicButtonSize.normal,
    bool? round,
    bool? disabled,
  })  : round = round ?? false,
        disabled = disabled ?? false,
        super(key: key);

  final void Function() onPressed;

  final Widget child;

  final EdgeInsetsGeometry? padding;

  final Color? primary;

  final Color? backgroundColor;

  final BorderSide? side;

  final TextStyle? textStyle;

  final BasicButtonSize? size;

  final bool? round;

  final bool? disabled;

  // 文字样式
  TextStyle get buttonTextStyle {
    // samll
    if (size == BasicButtonSize.small) {
      return const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
    }
    // large
    if (size == BasicButtonSize.large) {
      return const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.35);
    }
    // normal
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  }

  // 按钮内边距
  EdgeInsetsGeometry get buttonPadding {
    if (size == BasicButtonSize.small) {
      return const EdgeInsets.symmetric(vertical: 6, horizontal: 8);
    }
    if (size == BasicButtonSize.large) {
      return const EdgeInsets.symmetric(vertical: 10, horizontal: 15);
    }
    return const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled! ? null : onPressed,
      style: TextButton.styleFrom(
        padding: padding ?? buttonPadding,
        minimumSize: const Size(40, 20),
        visualDensity: VisualDensity.standard,
        primary: primary ?? AppTheme.nearlyWhite,
        // disabled text/icon color.withOpacity(0.38)
        onSurface: AppTheme.lightText,
        backgroundColor: disabled!
            ? AppTheme.spacer
            : (backgroundColor ?? AppTheme.primaryColor),
        side: side,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(round! ? 30 : 8))),
        textStyle: textStyle ?? buttonTextStyle,
      ),
      child: child,
    );
  }

  // outline layout for button
  factory BasicButton.outline({
    required onPressed,
    required Widget child,
    Color? primary = AppTheme.primaryColor,
    TextStyle? textStyle,
    BasicButtonSize? size,
    bool? round,
    bool? disabled = false,
  }) {
    return BasicButton(
      onPressed: onPressed,
      child: child,
      primary: primary,
      backgroundColor: Colors.transparent,
      side: BorderSide(color: primary!.withOpacity(disabled! ? 0.15 : 0.6)),
      textStyle: textStyle,
      size: size,
      round: round,
      disabled: disabled,
    );
  }
}

// button size
enum BasicButtonSize {
  small,
  normal,
  large,
}
