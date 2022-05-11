import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

Future<T?> showBasicBottomSheet<T>(
    {required BuildContext context, required Widget child, double? height}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height * 0.65,
          color: AppTheme.nearlyWhite,
          child: Stack(
            children: [
              Positioned.fill(child: child),
              Positioned(
                  right: 5,
                  top: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.close,
                        color: AppTheme.deactivatedText,
                      ),
                    ),
                  )),
            ],
          ),
        );
      });
}
