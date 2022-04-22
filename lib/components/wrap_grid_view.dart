import 'package:flutter/material.dart';

/// 栅格布局
/// 宽度均分，高度自适应可控
class WrapGridView extends StatelessWidget {
  const WrapGridView(
      {Key? key,
      this.lineCount = 5,
      this.spacing = 0.0,
      this.runSpacing = 0.0,
      required this.children})
      : super(key: key);

  final int? lineCount;
  final double? spacing;
  final double? runSpacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing!),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 父级约束 constraints
          double maxWidth = constraints.maxWidth;
          final boxWidth =
              (maxWidth - spacing! * (lineCount! - 1)) / lineCount!;

          return Wrap(
              spacing: spacing!,
              runSpacing: runSpacing!,
              children: children
                  .map((item) => SizedBox(width: boxWidth, child: item))
                  .toList());
        },
      ),
    );
  }
}
