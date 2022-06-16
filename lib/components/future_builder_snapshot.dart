import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

Widget futureBuilderSnapshot<T>(
    {required BuildContext context,
    required AsyncSnapshot<T> snapshot,
    Widget? child,
    Function? onSuccess}) {
  switch (snapshot.connectionState) {
    case ConnectionState.none:
    case ConnectionState.active:
    case ConnectionState.waiting:
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
        ),
      );
    case ConnectionState.done:
      if (snapshot.hasError) {
        return const Center(child: Text('网络请求出错', style: AppTheme.caption));
      }
      if (snapshot.hasData && onSuccess != null) {
        onSuccess(snapshot.data);
      }
      return child ?? const SizedBox.shrink();
  }
}
