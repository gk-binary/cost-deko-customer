import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SellFragment extends StatelessWidget {
  const SellFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Sell".text.make(),
        actions: [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: const Icon(
              Icons.add,
              size: 32,
            ).onInkTap(
              () => context.router.navigateNamed("/add-product"),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
