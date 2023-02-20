import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductGridView extends StatefulWidget {
  final Function(ProductModel) onTap;
  const ProductGridView({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  AppStore store = VxState.store as AppStore;
  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = store.products;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductGridItem(product: products[index]).onTap(() {
          widget.onTap.call(products[index]);
        });
      },
    );
  }
}

class ProductGridItem extends StatelessWidget {
  final ProductModel product;

  const ProductGridItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Center(
                child: product.images.isEmpty
                    ? (product.categoryName == "Fridge")
                        ? Image.asset("assets/fridge.png", fit: BoxFit.contain)
                        : Image.asset("assets/washingmachine.png",
                            fit: BoxFit.contain)
                    : Image.network(
                        product.images[0],
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
              ).p2(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "${product.manufacturer} ${product.capacity}${product.capacityUnit}"
                    .text
                    .bold
                    .xl
                    .maxLines(1)
                    .ellipsis
                    .make(),
                "${product.modelYear.toInt()} Model ${product.categoryName}"
                    .text
                    .bold
                    .xs
                    .capitalize
                    .gray400
                    .maxLines(1)
                    .ellipsis
                    .make(),
                4.heightBox,
                "₹${product.price.toInt()}".text.green800.bold.lg.make(),
                const SizedBox(height: 4.0),
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
      ),
    );
  }
}
