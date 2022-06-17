import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class FutureBuilderSnapshot<T> extends StatelessWidget {
  const FutureBuilderSnapshot(
      {Key? key,
      required this.context,
      required this.snapshot,
      this.builder,
      this.child})
      : super(key: key);

  final BuildContext context;
  final AsyncSnapshot<T> snapshot;
  final Function? builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
      case ConnectionState.waiting:
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppTheme.primaryColor),
            ),
          ),
        );
      case ConnectionState.done:
        if (snapshot.hasError) {
          return const Center(child: Text('网络请求出错', style: AppTheme.caption));
        }
        if (snapshot.hasData && builder != null) {
          return builder!(snapshot.data);
        }
        return child ?? const SizedBox.shrink();
    }
  }
}
