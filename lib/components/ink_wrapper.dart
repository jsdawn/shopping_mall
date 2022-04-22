import 'package:flutter/material.dart';

class InkWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? highlightColor;
  final BorderRadius? borderRadius;
  final Decoration? decoration;
  final Function()? onTap;
  final Function(bool)? onHighlightChanged;

  InkWrapper({
    Key? key,
    required this.child,
    this.color,
    this.highlightColor,
    this.borderRadius,
    Decoration? decoration,
    this.onTap,
    this.onHighlightChanged,
  })  : decoration = decoration ??
            BoxDecoration(color: color, borderRadius: borderRadius),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: decoration,
        child: InkWell(
          onTap: onTap,
          onHighlightChanged: onHighlightChanged,
          borderRadius: borderRadius,
          highlightColor: highlightColor,
          child: child,
        ),
      ),
    );
  }
}
