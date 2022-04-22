import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';
import 'package:shopping_mall/components/search_input.dart';

class GoodsHeaderSection extends StatelessWidget {
  const GoodsHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Text('运动休闲风', style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SizedBox(
            height: 40,
            child: SearchInput(),
          ),
        ),
      ],
    );
  }
}
