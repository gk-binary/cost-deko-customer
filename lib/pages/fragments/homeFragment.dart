import 'package:auto_route/auto_route.dart';
import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/widgets/all-products-grid.dart';
import 'package:costdeko/widgets/category-horizontal.dart';
import 'package:costdeko/widgets/offers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  AppStore store = VxState.store as AppStore;
  @override
  void initState() {
    GetCategories();
    GetBrands();
    GetProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [GetProducts, GetBrands, GetCategories]);

    return Scaffold(
      appBar: AppBar(
        title: "Bengaluru".text.make(),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search, size: 32),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: ListView(
          children: [
            HorizontalCategory(
              onTap: (item) => (item.isActive)
                  ? context.router.navigateNamed("/list-product/${item.id}")
                  : context.showToast(msg: "No ${item.name} found"),
            ),
            "Offer Zone".text.xl.bold.make(),
            10.heightBox,
            const Offers(),
            10.heightBox,
            "Brands with us".text.xl.bold.make(),
            10.heightBox,
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: store.availableBrandsModel.map((brand) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        fit: BoxFit.fill,
                        brand.imageUrl,
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(brand.name),
                    ],
                  ),
                ).onTap(
                    () => context.router.navigateNamed("/list-product/null"));
              }).toList(),
            ),
            10.heightBox,
            "All Items".text.xl.bold.make(),
            10.heightBox,
            ProductGridView(
              onTap: (product) =>
                  context.router.navigateNamed("/view-product/${product.id}"),
            ),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
