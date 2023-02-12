import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/feature-model.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct2 extends StatefulWidget {
  const AddProduct2({Key? key}) : super(key: key);

  @override
  State<AddProduct2> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct2> {
  @override
  void initState() {
    super.initState();
    GetFeatures();
  }

  AppStore store = VxState.store as AppStore;
  String categoryId = "";
  @override
  Widget build(BuildContext context) {
    categoryId = store.addItemResult["category_id"];

    int featureIndex =
        store.features.indexWhere((f) => f.category == categoryId);

    FeatureModel feature = store.features[featureIndex];
    return Scaffold(
      appBar: AppBar(
        title: "Add Item".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            MultiSelectDropDown(
              onOptionSelected: (List<ValueItem> selectedOptions) {},
              options: feature.feature
                  .map(
                    (item) => ValueItem(label: item, value: '1'),
                  )
                  .toList(),
              selectionType: SelectionType.multi,
              chipConfig: const ChipConfig(wrapType: WrapType.wrap),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(Icons.check_circle),
            ),
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
