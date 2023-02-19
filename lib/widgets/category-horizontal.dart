import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/category-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HorizontalCategory extends StatelessWidget {
  final Function(CategoryModel) onTap;
  const HorizontalCategory({
    Key? key,
    required this.onTap,
  }) : super(key: key);

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
    return Opacity(
      opacity: (item.isActive) ? 1 : 0.3,
      child: Container(
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
            ).onTap(() => onTap.call(item)),
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
      ),
    );
  }
}
