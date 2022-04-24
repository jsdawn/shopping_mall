import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    required this.child,
    this.padding,
    this.primary,
    this.backgroundColor,
    this.side,
    this.textStyle,
    this.size = BasicButtonSize.normal,
    bool? round,
  })  : round = round ?? false,
        super(key: key);

  final Widget child;

  final EdgeInsetsGeometry? padding;

  final Color? primary;

  final Color? backgroundColor;

  final BorderSide? side;

  final TextStyle? textStyle;

  final BasicButtonSize? size;

  final bool? round;

  TextStyle get buttonTextStyle {
    if (size == BasicButtonSize.small) {
      return const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
    }
    if (size == BasicButtonSize.large) {
      return const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 0.35);
    }
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  }

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
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: padding ?? buttonPadding,
        minimumSize: const Size(40, 20),
        visualDensity: VisualDensity.standard,
        primary: primary ?? AppTheme.nearlyWhite,
        backgroundColor: backgroundColor ?? AppTheme.primaryColor,
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
    required Widget child,
    Color? primary = AppTheme.primaryColor,
    TextStyle? textStyle,
    BasicButtonSize? size,
    bool? round,
  }) {
    return BasicButton(
      child: child,
      primary: primary,
      backgroundColor: Colors.transparent,
      side: BorderSide(color: primary!.withOpacity(0.6)),
      textStyle: textStyle,
      size: size,
      round: round,
    );
  }
}

// button size
enum BasicButtonSize {
  small,
  normal,
  large,
}
