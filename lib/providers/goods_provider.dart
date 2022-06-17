import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_mall/apis/api_util.dart';
import 'package:shopping_mall/models/goods_model.dart';

final goodsProvider = FutureProvider.family<GoodsModel, int>((ref, id) async {
  final content = await ApiUtil.getGoodsDetail(id);
  return content;
});

class GoodsProvederView extends ConsumerWidget {
  const GoodsProvederView({Key? key, required this.id, required this.builder})
      : super(key: key);

  final int id;
  final Function(GoodsModel goodsModel) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<GoodsModel> goodsDetail = ref.watch(goodsProvider(id));
    return goodsDetail.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (data) {
        return Text('success');
      },
    );
  }
}
