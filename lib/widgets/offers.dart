import 'package:costdeko/data/offers-banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/offers-model.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OffersModel> offersList = offersSlider;

    return VxSwiper.builder(
      itemCount: offersList.length,
      height: 200,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      isFastScrollingEnabled: false,
      onPageChanged: (index) => print("pageChanged"),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: context.percentWidth * 80,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Vx.red500,
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(offersList[index].image)),
          ),
        );
      },
    );
  }
}
