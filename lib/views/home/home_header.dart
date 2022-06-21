import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
      height: 60,
      color: AppTheme.nearlyWhite,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Welcome to'),
                Text('青山商城', style: _styleText),
              ],
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/logo.png'),
          )
        ],
      ),
    );
  }
}

TextStyle _styleText = const TextStyle(
  fontSize: 16,
  color: AppTheme.primaryColor,
  fontWeight: FontWeight.bold,
  letterSpacing: 0.85,
);
