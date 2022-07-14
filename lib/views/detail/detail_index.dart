import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/components/future_builder_snapshot.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/providers/goods_provider.dart';
import 'package:shopping_mall/utils/helper_util.dart';
import 'package:shopping_mall/views/detail/detail_footer_bar.dart';
import 'package:shopping_mall/views/detail/detail_header.dart';
import 'package:shopping_mall/views/detail/shop_title_block.dart';
import 'package:shopping_mall/views/detail/price_desc_block.dart';

class DetailIndex extends ConsumerStatefulWidget {
  const DetailIndex({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailIndex> createState() => _DetailIndexState();
}

class _DetailIndexState extends ConsumerState<DetailIndex> {
  int id = 0;

  // 获取并更新数据
  Future _getDetailInfo(id) async {
    if (!mounted) return;
    await ref.read(goodsProvider.notifier).getGoodsInfo(id);
    return '完成加载';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    id = HelperUtil.getRouteParam(context, 'id') ?? 0;

    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: const BasicAppBar(title: Text('详情')),
      body: FutureBuilder(
          future: _getDetailInfo(id),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            return FutureBuilderSnapshot(
                context: ctx,
                snapshot: snapshot,
                builder: (_data) {
                  return Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: _buildBodyUI,
                      ),
                    ),
                    const DetailFooterBar()
                  ]);
                });
          }),
    );
  }

  final Widget _buildBodyUI = Consumer(builder: (context, ref, child) {
    GoodsModel goodsDetail = ref.watch(goodsProvider);
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom +
              DetailFooterBar.height +
              25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DetailHeader(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const ShopTitleBlock(),
          ),

          // 详情介绍
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.center,
            child: const Text('详情介绍', style: AppTheme.caption),
          ),
          Container(
            color: AppTheme.nearlyWhite,
            child: Column(
              children: goodsDetail.images.map((imgUrl) {
                return Image.network(imgUrl, fit: BoxFit.fitWidth);
              }).toList(),
            ),
          ),
          const PriceDescBlock(),
        ],
      ),
    );
  });
}
