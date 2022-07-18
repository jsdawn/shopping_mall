import 'package:flutter/material.dart';
import 'package:shopping_mall/views/detail/detail_index.dart';
import 'package:shopping_mall/views/goods/goods_list_index.dart';

/// onGenerateRoute
/// Navigator.of(context).pushNamed('/detail');
///
Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/detail':
      return MaterialPageRoute(
          builder: (_) => const DetailIndex(), settings: settings);
    case '/goods':
      return MaterialPageRoute(
          builder: (_) => const GoodsListIndex(), settings: settings);
    // 404
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('404'),
          ),
          body: const Center(child: Text('Not Found.')),
        ),
      );
  }
}
