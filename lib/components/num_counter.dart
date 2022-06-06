import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class NumCounter extends StatelessWidget {
  const NumCounter({
    Key? key,
    required this.count,
    this.minCount = 1,
    this.maxCount = 10,
    this.onChange,
  }) : super(key: key);

  final int count;
  final int? minCount;
  final int? maxCount;

  final void Function(int count)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _iconBtn(
          Icons.remove,
          disabled: count <= minCount!,
          onTap: () {
            if (onChange != null) {
              onChange!(count - 1);
            }
          },
        ),
        Container(
          height: 30,
          width: 45,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppTheme.spacer,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Text(count.toString(), style: const TextStyle(fontSize: 16)),
        ),
        _iconBtn(
          Icons.add,
          disabled: count >= maxCount!,
          onTap: () {
            if (onChange != null) {
              onChange!(count + 1);
            }
          },
        ),
      ],
    );
  }

  Widget _iconBtn(IconData icon, {Function()? onTap, bool? disabled = false}) {
    return GestureDetector(
      onTap: disabled! ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
        child: Icon(
          icon,
          color: disabled
              ? AppTheme.deactivatedText.withOpacity(0.5)
              : AppTheme.grey,
          size: 20,
        ),
      ),
    );
  }
}
