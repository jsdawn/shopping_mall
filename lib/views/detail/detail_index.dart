import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_app_bar.dart';
import 'package:shopping_mall/views/detail/detail_footer_bar.dart';
import 'package:shopping_mall/views/detail/detail_header.dart';
import 'package:shopping_mall/views/detail/shop_title_block.dart';
import 'package:shopping_mall/views/detail/price_desc_block.dart';

class DetailIndex extends StatefulWidget {
  const DetailIndex({Key? key}) : super(key: key);

  @override
  State<DetailIndex> createState() => _DetailIndexState();
}

class _DetailIndexState extends State<DetailIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: const BasicAppBar(title: Text('详情')),
      body: Stack(children: [
        SingleChildScrollView(
          child: _buildBody(context),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 0,
          right: 0,
          child: const DetailFooterBar(),
        )
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
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
              children: [
                Image.network(
                  'https://unpkg.com/@jsdawn/assets/images/mall/Clothes1.jpg',
                  fit: BoxFit.fitWidth,
                ),
                Image.network(
                  'https://unpkg.com/@jsdawn/assets/images/mall/book1.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
          const PriceDescBlock(),
        ],
      ),
    );
  }
}
