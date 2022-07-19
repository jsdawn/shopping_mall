import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_home_screen.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/providers/cart_provider.dart';
import 'package:shopping_mall/router/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // 顶部状态栏颜色
    statusBarColor: Colors.transparent,
    // 顶部状态栏图标的亮度
    statusBarIconBrightness: Brightness.dark,
    // 顶部状态栏的亮度
    statusBarBrightness:
        !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
    // 系统底部导航栏的颜色
    systemNavigationBarColor: Colors.white,
    // 系统底部导航栏分割线颜色
    systemNavigationBarDividerColor: Colors.transparent,
    // 系统导航栏图标的亮度
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(cartProvider).getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '青山商城',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: AppTheme.fontName,
        textTheme: AppTheme.textTheme,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
      home: const AppHomeScreen(),
    );
  }
}
