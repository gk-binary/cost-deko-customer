import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HorizontalCategory extends StatelessWidget {
  const HorizontalCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBuilder<AppStore>(
      mutations: const {GetCategories},
      builder: (context, store, status) => Container(
        height: 130,
        child: ListView.builder(
          itemCount: store.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) =>
              _listItem(ctx, index, store.categories[index]),
        ),
      ),
    );
  }

  Widget _listItem(ctx, index, item) {
    return Container(
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
                  backgroundImage: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage("${item.image}")),
                ),
              )
            ],
          ),
          Flexible(
              child: SizedBox(
            width: 100,
            height: 30,
            child: "${item.name}"
                .text
                .xs
                .bold
                .ellipsis
                .capitalize
                .center
                .maxLines(2)
                .make(),
          ))
        ],
      ),
    );
  }
}
