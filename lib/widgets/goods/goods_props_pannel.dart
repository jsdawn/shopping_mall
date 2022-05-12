import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/basic_button.dart';
import 'package:shopping_mall/components/num_counter.dart';
import 'package:shopping_mall/models/cart_info_model.dart';

class GoodsCartPannel extends StatefulWidget {
  const GoodsCartPannel({Key? key, required this.cartInfo}) : super(key: key);

  final CartInfoModel cartInfo;

  @override
  State<GoodsCartPannel> createState() => _GoodsCartPannelState();
}

class _GoodsCartPannelState extends State<GoodsCartPannel> {
  late CartInfoModel _cartInfo;

  List<String> colorOptions = ['白色', '灰色', '深蓝色', '黑色'];
  List<String> sizeOptions = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    super.initState();
    _cartInfo = widget.cartInfo;
  }

  @override
  void didUpdateWidget(GoodsCartPannel oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
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
                  colorOptions,
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
                  sizeOptions,
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
                print(_cartInfo);
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
            'https://unpkg.com/@jsdawn/assets/images/mall/Clothes1.jpg',
            fit: BoxFit.contain,
            width: 90,
            height: 90,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: const TextSpan(
                  text: '￥',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '59',
                      style: TextStyle(fontSize: 24),
                    ),
                    TextSpan(
                      text: '.09 ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  '库存 286',
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
