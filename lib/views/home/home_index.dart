import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/search_input.dart';

import 'category_section.dart';
import 'goods_list_section.dart';
import 'header_section.dart';

class HomeIndex extends StatelessWidget {
  const HomeIndex({Key? key}) : super(key: key);

  final double headerHeight = HeaderSection.headerHeight;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppTheme.nearlyWhite,
      child: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: headerHeight),
            child: _buildBody(context),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: headerHeight,
            child: const HeaderSection()),
      ]),
    );
  }

  // 正文内容区域
  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 搜索框
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 50,
                child: const SearchInput(),
              ),
              const Spacer(),
            ],
          ),
        ),
        // 分类列表
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: CategorySection(),
        ),
        // 热推商品
        _sectionTitle(title: '热门商品'),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: GoodsListSection(),
        ),
      ],
    );
  }

  Widget _sectionTitle({String? title = ''}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Text(
        title!,
        style: AppTheme.headline.copyWith(color: AppTheme.lightText),
      ),
    );
  }
}
