import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HorizontalCategory extends StatelessWidget {
  const HorizontalCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  VxCircle(
                    radius: 80,
                    backgroundColor: Vx.white,
                    border: Border.all(width: 1, color: Vx.black),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: VxCircle(
                      radius: 70,
                      backgroundColor: Vx.white,
                      backgroundImage: const DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://www.91-cdn.com/hub/wp-content/uploads/2021/01/amazon-sale-refrigerator-deals-1200x900.png")),
                    ),
                  )
                ],
              ),
              Flexible(
                  child: Container(
                width: 100,
                height: 20,
                child: "Refrigerator".text.sm.bold.ellipsis.center.make(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
