import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: AppTheme.notWhite,
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                style: const TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontSize: 16,
                  color: AppTheme.primaryColor,
                ),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Search for goods',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: AppTheme.deactivatedText,
                  ),
                  isCollapsed: true,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.search, color: AppTheme.deactivatedText),
          )
        ],
      ),
    );
  }
}
