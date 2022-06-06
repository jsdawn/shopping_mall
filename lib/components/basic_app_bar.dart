import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BasicAppBar({Key? key, this.title, this.actions, this.toolbarHeight})
      : super(key: key);

  final Widget? title;
  final List<Widget>? actions;
  final double? toolbarHeight;

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 50);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      // leading: const BackButton(), // AppBar可自动识别是否存在返回页
      title: widget.title,
      actions: widget.actions,
      backgroundColor: AppTheme.nearlyWhite,
      elevation: 1,
      iconTheme: const IconThemeData(
        size: 18,
        color: AppTheme.darkText,
      ),
      titleTextStyle: const TextStyle(
        color: AppTheme.darkerText,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
