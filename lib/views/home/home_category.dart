import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/wrap_grid_view.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  final List<Category> categorys = const [
    Category(label: '化妆品', icon: 'assets/svg/category_cosmetics.svg'),
    Category(label: '服饰', icon: 'assets/svg/category_costume.svg'),
    Category(label: '手机', icon: 'assets/svg/category_phone.svg'),
    Category(label: '家电', icon: 'assets/svg/category_appliance.svg'),
    Category(label: '酒水', icon: 'assets/svg/category_drinks.svg'),
    Category(label: '生鲜水果', icon: 'assets/svg/category_fruits.svg'),
    Category(label: '书籍', icon: 'assets/svg/category_book.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return WrapGridView(
      spacing: 5.0,
      runSpacing: 15.0,
      lineCount: 5,
      children: categorys.map((item) => CategoryItem(item)).toList(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.item, {Key? key}) : super(key: key);
  final Category item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/goods', arguments: {'category': item.label});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.asset(item.icon, height: 35),
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
}

class Category {
  final String? label;
  final String icon;

  const Category({this.label, required this.icon});
}
