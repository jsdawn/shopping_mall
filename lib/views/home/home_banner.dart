import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

List images = [
  'http://dummyimage.com/600x200/B9C6C3&text=shopping%20banner1',
  'http://dummyimage.com/600x200/B9C6C3&text=shopping%20banner2',
  'http://dummyimage.com/600x200/B9C6C3&text=shopping%20banner3',
];

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        return Image.network(images[index], fit: BoxFit.fill);
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      itemCount: images.length,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomRight,
        builder: DotSwiperPaginationBuilder(activeColor: Colors.green),
      ),
    );
  }
}
