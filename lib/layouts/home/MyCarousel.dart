import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MyCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 375.0,
        height: 300.0,
        child: Carousel(
          images: [
            AssetImage("lib/assets/img/unsplash1.jpg"),
            AssetImage("lib/assets/img/unsplash2.jpg"),
            AssetImage("lib/assets/img/unsplash3.jpg"),
          ],
          autoplay: false,
          animationCurve: Curves.fastLinearToSlowEaseIn,
        )
      )
    );
  }
}
