import 'package:costdeko/widgets/category-horizontal.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Cost Deko".text.make(),
      ),
      body: ListView(
        children: const [
          HorizontalCategory(),
        ],
      ),
    );
  }
}
