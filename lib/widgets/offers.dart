import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxSwiper.builder(
      itemCount: 10,
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
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://navbharattimes.indiatimes.com/thumb/msid-94469688,imgsize-98348,width-540,height-405,resizemode-75/best-seller-washing-machine-94469688.jpg")),
          ),
        );
      },
    );
  }
}
