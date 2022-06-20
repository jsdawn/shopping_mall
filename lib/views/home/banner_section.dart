import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

final List images = [
  'http://dummyimage.com/600x200/6A7875&text=shopping%20banner1',
  'http://dummyimage.com/600x200/6A7875&text=shopping%20banner2',
  'http://dummyimage.com/600x200/6A7875&text=shopping%20banner3',
];

class BannerSection extends StatelessWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        final image = images[index];
        return Image.network(image, fit: BoxFit.fill);
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      itemCount: images.length,
      pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(activeColor: Colors.green)),
    );
  }
}
