import 'package:costdeko/data/manufacturers.dart';
import 'package:costdeko/management/mutations.dart';
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
  @override
  void initState() {
    GetCategories();
    GetBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            const HorizontalCategory(),
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
              children: brands.map((brand) {
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
                );
              }).toList(),
            ),
            100.heightBox
          ],
        ),
      ),
    );
  }
}
