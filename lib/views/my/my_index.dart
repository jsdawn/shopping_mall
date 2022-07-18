import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_mall/app_theme.dart';

class MyIndex extends StatefulWidget {
  const MyIndex({Key? key}) : super(key: key);

  @override
  State<MyIndex> createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppTheme.chipBackground,
      child: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverToBoxAdapter(child: _buildUserInfo()),
          SliverToBoxAdapter(child: _buildOrderButtons()),
          SliverToBoxAdapter(child: _buildBanner()),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return const SliverAppBar(
      expandedHeight: 130.0,
      title: Text('个人中心'),
      centerTitle: true,
      elevation: 1,
      pinned: true,
      backgroundColor: AppTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax, //视差效果
        background: ColoredBox(color: AppTheme.primaryColor),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      color: AppTheme.primaryColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: AppTheme.nearlyWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/userimg.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('青山依旧', style: AppTheme.title),
                Text('抽象设计师，VIP购物狂人', style: AppTheme.caption),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderButtons() {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15.0),
      color: AppTheme.nearlyWhite,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '商城订单',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
                  Text('全部订单', style: AppTheme.caption),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppTheme.lightText,
                    size: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _orderButton('待付款', 'assets/svg/order_daifukuan.svg'),
            _orderButton('待发货', 'assets/svg/order_daifahuo.svg'),
            _orderButton('待收货', 'assets/svg/order_daishouhuo.svg'),
            _orderButton('待评价', 'assets/svg/order_daipingjia.svg'),
            _orderButton('退款售后', 'assets/svg/order_shouhou.svg')
          ],
        )
      ]),
    );
  }

  Widget _orderButton(String label, String assetName) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(
              assetName,
              height: 32,
              color: AppTheme.primaryColor,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppTheme.darkText),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      color: AppTheme.nearlyWhite,
      child: Column(children: [
        Image.asset('assets/images/pingxing_green.png'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            '来平行心理，探索平行时空的另一个你。分享生活经验，关注心理健康，提供专业测评。专注自我探索、情感问题、亲子关系、职场成长。',
            style: AppTheme.caption,
          ),
        ),
      ]),
    );
  }
}
