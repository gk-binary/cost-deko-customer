import 'package:costdeko/management/store.dart';
import 'package:costdeko/utils/string_extentions.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct2 extends StatefulWidget {
  const AddProduct2({Key? key}) : super(key: key);

  @override
  State<AddProduct2> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct2> {
  AppStore store = VxState.store as AppStore;
  // final List<String> items = store.categoryNames;
  String? itemType;
  String? brandName;

  List<DropdownMenuItem<String>> _addDividersAfterItems(items) {
    List<DropdownMenuItem<String>> _menuItems = [];

    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "$item".toTitleCase(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights(items) {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  String capacityUnit = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Item".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            10.heightBox,
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  child: "Next".text.xl.bold.make(),
                ))
          ],
        ),
      ),
    );
  }
}
