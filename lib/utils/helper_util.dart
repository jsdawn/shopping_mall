import 'package:flutter/material.dart';

class HelperUtil {
  /// 获取路由参数
  static getRouteParam(BuildContext context, String key) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      Map args = ModalRoute.of(context)?.settings.arguments as Map;
      return args[key];
    } else {
      return null;
    }
  }
}
