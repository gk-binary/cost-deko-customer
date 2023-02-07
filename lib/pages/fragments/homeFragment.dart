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
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://images.samsung.com/is/image/samsung/assets/in/about-us/brand/logo/mo/360_197_1.png"),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://upload.wikimedia.org/wikipedia/commons/d/de/Haier.White.logo.png"),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://1000logos.net/wp-content/uploads/2017/03/LG-Symbol.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://brandirectory-live-public.s3.eu-west-2.amazonaws.com/logos/0d63d038-cca3-49fe-9861-8b6414379bde.jpg%3FBosch.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://vectorseek.com/wp-content/uploads/2021/01/Whirlpool-Logo-Vector-scaled.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(2),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "http://godrejexpert.com/wp-content/uploads/2017/11/cropped-logo-01.png"),
                ),
              ],
            ),
            100.heightBox
          ],
        ),
      ),
    );
  }
}
