import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/components/future_builder_snapshot.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/providers/goods_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: const BasicAppBar(title: Text('详情')),
      body: FutureBuilder<GoodsModel>(
          future: ApiUtil.getGoodsDetail(2),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            return futureBuilderSnapshot(
                context: ctx,
                snapshot: snapshot,
                onSuccess: (data) {
                  ref.read(goodsProvider.notifier).setGoods(data);
                },
                child: Stack(children: [
                  SingleChildScrollView(
                    child: _buildBodyUI,
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom,
                    left: 0,
                    right: 0,
                    child: const DetailFooterBar(),
                  )
                ]));
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
