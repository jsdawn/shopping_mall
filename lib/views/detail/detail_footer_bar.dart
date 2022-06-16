import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/show_basic_bottom_sheet.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/providers/goods_provider.dart';
import 'package:shopping_mall/widgets/goods/goods_props_pannel.dart';

class DetailFooterBar extends ConsumerStatefulWidget {
  const DetailFooterBar({Key? key}) : super(key: key);

  static double height = 55;

  @override
  ConsumerState<DetailFooterBar> createState() => _DetailFooterBarState();
}

class _DetailFooterBarState extends ConsumerState<DetailFooterBar> {
  // 当前商品购物属性过滤器
  late CartInfoModel _cartInfo;
  late GoodsModel _goodsDetail;

  @override
  void initState() {
    super.initState();
    // initState 只能 read
    _goodsDetail = ref.read(goodsProvider);
    // 初始化商品购物属性
    _cartInfo = CartInfoModel(
        id: _goodsDetail.id,
        title: _goodsDetail.title,
        price: _goodsDetail.price,
        image: _goodsDetail.cover,
        count: 1,
        color: _goodsDetail.colorOptions[0],
        size: _goodsDetail.sizeOptions[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DetailFooterBar.height,
      decoration: const BoxDecoration(
        color: AppTheme.nearlyWhite,
        border: Border(
            top: BorderSide(
          color: AppTheme.notWhite,
          width: 1,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _footerIconButton(Icons.home_outlined, '首页', onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }),
                _footerIconButton(Icons.shopping_cart_outlined, '购物车',
                    onTap: () {
                  Navigator.of(context).pushNamed('/', arguments: {'tab': 2});
                }),
                _footerIconButton(Icons.account_circle_outlined, '我的',
                    onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (route) => false,
                      arguments: {'tab': 3});
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BasicButton(
              onPressed: () {
                _showGoodsPropsSheet(context);
              },
              child: const Text('加入购物车'),
              size: BasicButtonSize.large,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerIconButton(IconData iconData, String label,
      {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 25),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child:
                  Text(label, style: AppTheme.caption.copyWith(fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }

  void _showGoodsPropsSheet(BuildContext context) {
    setState(() {
      _cartInfo.count = 1;
    });
    showBasicBottomSheet(
      context: context,
      child: GoodsCartPannel(
        cartInfo: _cartInfo,
        goodsDetail: _goodsDetail,
      ),
    );
  }
}
