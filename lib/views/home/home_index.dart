import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/search_input.dart';
import 'package:shopping_mall/views/home/home_banner.dart';
import 'package:shopping_mall/views/home/home_category.dart';
import 'package:shopping_mall/views/home/home_header.dart';
import 'package:shopping_mall/views/home/home_list.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({Key? key}) : super(key: key);

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: AppTheme.nearlyWhite,
      child: Column(children: [
        const HomeHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: _buildBodyUI(context),
          ),
        ),
      ]),
    );
  }

  /// 正文内容区域
  Widget _buildBodyUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 搜索框
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 15.0,
            right: MediaQuery.of(context).size.width * 0.25,
          ),
          child: const SearchInput(),
        ),
        // banner
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: AspectRatio(aspectRatio: 3.0, child: HomeBanner()),
        ),
        // 分类列表
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: HomeCategory(),
        ),
        // 热推商品
        const HomeList(),
      ],
    );
  }
}
