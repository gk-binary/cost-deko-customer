import 'package:auto_route/auto_route.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewProduct extends StatefulWidget {
  final String productID;
  const ViewProduct({Key? key, @PathParam('id') required this.productID})
      : super(key: key);

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  AppStore store = VxState.store as AppStore;
  late ProductModel product;

  @override
  Widget build(BuildContext context) {
    int productIndex =
        store.myProducts.indexWhere((f) => f.id == widget.productID);

    if (productIndex == -1) {
      int productIndex =
          store.products.indexWhere((f) => f.id == widget.productID);
      product = store.products[productIndex];
    } else {
      product = store.myProducts[productIndex];
    }

    return Scaffold(
      appBar: AppBar(title: "Product Details".text.make()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          VxSwiper.builder(
            itemCount: 10,
            height: 400,
            viewportFraction: 1.0,
            itemBuilder: (context, index) {
              return "Item $index"
                  .text
                  .white
                  .make()
                  .box
                  .alignCenter
                  .color(Vx.randomOpaqueColor)
                  .make();
            },
          ),
          10.heightBox,
          "${product.manufacturer} ${product.categoryName}"
              .text
              .xl2
              .bold
              .capitalize
              .make(),
          10.heightBox,
          "${product.capacity} ${product.capacityUnit} || ${product.modelYear.toInt()} Model"
              .text
              .xl
              .bold
              .gray500
              .capitalize
              .make(),
          10.heightBox,
          "Price: ${product.price.toInt()} Rs".text.xl.bold.capitalize.make(),
          10.heightBox,
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.cart),
                    5.widthBox,
                    "Add to cart".text.bold.make()
                  ],
                ),
              ),
            ),
          ),
          10.heightBox,
          "Description".text.lg.bold.make(),
          5.heightBox,
          "${product.description}".text.justify.make(),
          10.heightBox,
          "Features".text.lg.bold.make(),
          Wrap(
            children: product.features
                .map(
                  (e) => Chip(
                    backgroundColor: Vx.randomColor,
                    label: e.text.bold.capitalize.make(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).pOnly(right: 5),
                )
                .toList(),
          ),
          10.heightBox,
          Row(
            children: [
              "Power rating : ".text.lg.bold.make(),
              VxRating(
                  onRatingUpdate: (String value) {},
                  isSelectable: false,
                  count: 5,
                  maxRating: 5,
                  selectionColor: Colors.teal,
                  size: 30,
                  stepInt: true,
                  value: product.energyStarRating.toDouble())
            ],
          ),
          10.heightBox,
          Row(
            children: [
              "Current Consumption : ".text.lg.bold.make(),
              "${product.powerRating} KW".text.lg.make()
            ],
          ),
          10.heightBox,
          _trueFalseItem("EMI Option available", product.isEmiAvailable),
          _trueFalseItem(
              "Accessories available", product.isAccessoriesAvailable),
          _trueFalseItem(
              "Accessories available", product.isAccessoriesAvailable),
          _trueFalseItem("Bill available", product.isBillAvailable),
          _trueFalseItem("Warranty available", product.isWarrantyAvailable),
          product.isWarrantyAvailable
              ? "${product.warrantyPeriodInMonths} Months Warranty \n${product.warrantyDetails}"
                  .text
                  .capitalize
                  .make()
                  .p12()
                  .card
                  .make()
              : Container(),
          _trueFalseItem(
              "Free Service available", product.isFreeServiceAvailable),
          product.isFreeServiceAvailable
              ? "${product.freeServicePeriodInMonths} Months Free Service"
                  .text
                  .capitalize
                  .make()
                  .p12()
                  .card
                  .make()
              : Container(),
          _trueFalseItem(
              "Free Home Delivery available", product.isHomeDeliveryFree),
        ]),
      ),
    );
  }

  _trueFalseItem(String itemName, bool itemValue) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemName.text.lg.bold.make(),
          itemValue
              ? const Icon(CupertinoIcons.check_mark_circled_solid,
                  color: Vx.green900)
              : const Icon(CupertinoIcons.xmark_circle_fill, color: Vx.red900)
        ],
      ).p12();
}
