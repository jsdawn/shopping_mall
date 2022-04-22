import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/wrap_grid_view.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  final List<Category> categorys = const [
    Category(label: '美食', icon: Icons.account_balance_wallet_outlined),
    Category(label: '休闲娱乐', icon: Icons.account_balance_wallet_outlined),
    Category(label: '霸王餐', icon: Icons.account_balance_wallet_outlined),
    Category(label: '电影票', icon: Icons.account_balance_wallet_outlined),
    Category(label: '下午茶', icon: Icons.account_balance_wallet_outlined),
    Category(label: '火锅', icon: Icons.account_balance_wallet_outlined),
    Category(label: '烤肉', icon: Icons.account_balance_wallet_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return WrapGridView(
      spacing: 5.0,
      runSpacing: 10.0,
      lineCount: 5,
      children: categorys.map((item) => _categoryItem(item)).toList(),
    );
  }
}

//

Widget _categoryItem(Category item) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Icon(item.icon, size: 35),
        ),
        Text(
          item.label!,
          style: const TextStyle(fontSize: 11, color: AppTheme.darkText),
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

class Category {
  final String? label;
  final IconData icon;

  const Category({this.label, required this.icon});
}
