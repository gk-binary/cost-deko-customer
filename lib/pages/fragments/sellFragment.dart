import 'package:auto_route/auto_route.dart';
import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class SellFragment extends StatefulWidget {
  const SellFragment({Key? key}) : super(key: key);

  @override
  State<SellFragment> createState() => _SellFragmentState();
}

class _SellFragmentState extends State<SellFragment> {
  // "test".toCapitalized();
  AppStore store = VxState.store as AppStore;
  @override
  void initState() {
    GetMyProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [GetMyProducts]);
    return Scaffold(
      appBar: AppBar(
        title: "Sell".text.make(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Icon(
              Icons.add,
              size: 32,
            ).onInkTap(
              () => context.router.navigateNamed("/add-product"),
            ),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: store.myProducts.length,
        itemBuilder: (ctx, index) => _listItem(store.myProducts[index]),
      ),
    );
  }

  Widget _listItem(item) => Container(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading: (item.images.isEmpty)
              ? (item.categoryName == "Fridge")
                  ? Image.asset("assets/fridge.png", fit: BoxFit.contain)
                  : Image.asset("assets/washingmachine.png",
                      fit: BoxFit.contain)
              : Image.network(item.images[0]),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${item.categoryName} (${item.capacity} ${item.capacityUnit})"
                  .text
                  .capitalize
                  .make(),
              "${item.modelYear.toInt()} Model".text.capitalize.make(),
              "Added On: ${DateFormat('dd-MMM-yyyy').format(item.createdOn)}"
                  .text
                  .make()
            ],
          ),
          onTap: () {
            context.router.navigateNamed("/view-product/${item.id}");
          },
        ).p4().card.make(),
      );
}
