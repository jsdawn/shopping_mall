import 'package:flutter/material.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/future_builder_snapshot.dart';
import 'package:shopping_mall/components/search_input.dart';
import 'package:shopping_mall/widgets/goods/goods_list.dart';

import 'category_section.dart';
import 'header_section.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({Key? key}) : super(key: key);

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with AutomaticKeepAliveClientMixin {
  final double _headerHeight = HeaderSection.headerHeight;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: AppTheme.nearlyWhite,
      child: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: _headerHeight),
            child: _buildBody(context),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: _headerHeight,
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
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _buildListUI(),
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

  Widget _buildListUI() {
    return FutureBuilder(
        future: ApiUtil.getGoodsList(page: 1, size: 20),
        builder: (context, snapshot) {
          return FutureBuilderSnapshot(
            context: context,
            snapshot: snapshot,
            builder: (data) {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: GoodsList(data),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: AppTheme.chipBackground,
                    child: Center(
                      child: BasicButton.outline(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (route) => false,
                              arguments: {'tab': 1});
                        },
                        child: const Text('前往查看更多'),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        });
  }
}
