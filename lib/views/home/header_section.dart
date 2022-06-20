import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  static const double headerHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
      height: headerHeight,
      color: AppTheme.nearlyWhite,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text('Welcome to', textAlign: TextAlign.left),
                Text(
                  '青山商城',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.85),
                ),
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
