import 'package:auto_route/auto_route.dart';
import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ListProduct extends StatefulWidget {
  final String categoryId;
  const ListProduct({Key? key, @PathParam('name') required this.categoryId})
      : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  AppStore store = VxState.store as AppStore;
  @override
  void initState() {
    GetProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int categoryIndex = 0;
    VxState.watch(context, on: [GetProducts, AddProduct]);
    List<String> filterHeader = store.categoryNames;
    if (widget.categoryId != "null") {
      categoryIndex =
          store.categories.indexWhere((f) => f.id == widget.categoryId);
      if (categoryIndex == -1) {
        categoryIndex = 0;
      }
    } else {
      categoryIndex = 0;
    }
    print(categoryIndex);
    return DefaultTabController(
      length: filterHeader.length,
      initialIndex: categoryIndex,
      child: Scaffold(
          appBar: AppBar(
            title: "Products".text.make(),
            bottom: TabBar(
              tabs: filterHeader
                  .map(
                    (e) => Tab(child: e.text.center.capitalize.make()),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: filterHeader.map((category) {
              var products = store?.productsWithCategories[category];
              return products != null && products.isNotEmpty
                  ? ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return _listItem(products[index]);
                      },
                    )
                  : const Center(
                      child: Text("No products found in this category"),
                    );
            }).toList(),
          )),
    );
  }

  Widget _listItem(ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: (product.images.isEmpty)
              ? (product.categoryName == "Fridge")
                  ? Image.asset("assets/fridge.png", fit: BoxFit.contain)
                  : Image.asset("assets/washingmachine.png",
                      fit: BoxFit.contain)
              : Image.network(product.images[0]),
        ),
        10.widthBox,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${product.capacity}${product.capacityUnit} ${product.manufacturer} ${product.categoryName}"
                  .text
                  .ellipsis
                  .bold
                  .xl
                  .make(),
              2.heightBox,
              Wrap(
                children: [
                  "${product.price.toInt()} Rs"
                      .text
                      .xl
                      .gray500
                      .overflow(TextOverflow.ellipsis)
                      .make(),
                  " || ${product.modelYear.toInt()} Model"
                      .text
                      .gray500
                      .xl
                      .overflow(TextOverflow.ellipsis)
                      .make(),
                ],
              ),
              8.heightBox,
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
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
            ],
          ),
        ),
      ],
    ).p4().card.make().onTap(() {
      context.router.navigateNamed("/view-product/${product.id}");
    });
  }
}
