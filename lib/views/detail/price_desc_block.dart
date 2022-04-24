import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class PriceDescBlock extends StatelessWidget {
  const PriceDescBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: AppTheme.nearlyWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text('价格说明',
                style: AppTheme.body1.copyWith(color: AppTheme.lightText)),
          ),
          const Text('划线价格'),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              '与实际标价比较，并非原价或线下实际销售价。该划线价可能是商品或服务的门市价、零售价（如品牌指导价、建议零售价）、历史标价中的一项',
              style: AppTheme.caption,
            ),
          ),
          const Text('未划线价'),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              '指商品服务实时标价，最终的成交价以订单结算页价格为准',
              style: AppTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
