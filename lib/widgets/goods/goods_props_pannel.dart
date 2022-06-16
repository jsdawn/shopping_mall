import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/num_counter.dart';
import 'package:shopping_mall/models/cart_info_model.dart';
import 'package:shopping_mall/models/goods_model.dart';
import 'package:shopping_mall/providers/cart_provider.dart';
import 'package:shopping_mall/widgets/goods/goods_price.dart';

class GoodsCartPannel extends ConsumerStatefulWidget {
  const GoodsCartPannel(
      {Key? key, required this.cartInfo, required this.goodsDetail})
      : super(key: key);

  final CartInfoModel cartInfo;
  final GoodsModel goodsDetail;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GoodsCartPannelState();
}

class _GoodsCartPannelState extends ConsumerState<GoodsCartPannel> {
  late CartInfoModel _cartInfo;

  @override
  void initState() {
    super.initState();
    _cartInfo = widget.cartInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _goodsSimpleInfo(),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text('颜色', style: AppTheme.body1),
                ),
                _propsSelector(
                  widget.goodsDetail.colorOptions,
                  actived: _cartInfo.color,
                  onChange: (newActived) {
                    setState(() {
                      _cartInfo.color = newActived;
                    });
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text('尺寸', style: AppTheme.body1),
                ),
                _propsSelector(
                  widget.goodsDetail.sizeOptions,
                  actived: _cartInfo.size,
                  onChange: (newActived) {
                    setState(() {
                      _cartInfo.size = newActived;
                    });
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('购买数量', style: AppTheme.body1),
                    NumCounter(
                      onChange: (newCount) {
                        setState(() {
                          _cartInfo.count = newCount;
                        });
                      },
                      count: _cartInfo.count,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // 确认按钮 height-66
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: AppTheme.nearlyWhite,
            child: BasicButton(
              onPressed: () {
                ref.read(cartProvider.notifier).pushCart(_cartInfo);
                Navigator.of(context).pop();
              },
              size: BasicButtonSize.large,
              child: const Text('确认'),
            ),
          ),
        )
      ],
    );
  }

  // 商品简要信息
  Widget _goodsSimpleInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Image.network(
            widget.goodsDetail.cover,
            fit: BoxFit.contain,
            width: 90,
            height: 90,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GoodsPrice(
                price: widget.goodsDetail.price,
                size: GoodsPriceSize.large,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  '库存 ${widget.goodsDetail.inventory}',
                  style: AppTheme.caption.copyWith(fontSize: 14),
                ),
              ),
              Text("已选 ${_cartInfo.color}，${_cartInfo.size}"),
            ],
          ),
        )
      ],
    );
  }

  // 商品属性选择器 - 单选
  Widget _propsSelector(
    List<String> options, {
    String? actived = '',
    void Function(String newActived)? onChange,
  }) {
    return Wrap(
      children: options.map((opt) {
        bool isActived = opt == actived;
        return Padding(
          padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
          child: TextButton(
            onPressed: () {
              if (onChange != null) onChange(opt);
            },
            child: Text(opt),
            style: TextButton.styleFrom(
              primary: isActived ? AppTheme.primaryColor : AppTheme.darkText,
              backgroundColor: isActived
                  ? AppTheme.primaryColor.withOpacity(0.15)
                  : AppTheme.spacer,
              minimumSize: const Size(60, 35),
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: isActived ? FontWeight.bold : FontWeight.w400,
                color: isActived ? AppTheme.primaryColor : AppTheme.darkText,
              ),
              side: isActived
                  ? const BorderSide(color: AppTheme.primaryColor, width: 1)
                  : BorderSide.none,
            ),
          ),
        );
      }).toList(),
    );
  }
}
