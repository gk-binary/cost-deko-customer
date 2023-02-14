import 'package:auto_route/auto_route.dart';
import 'package:costdeko/management/store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  AppStore store = VxState.store as AppStore;
  // final List<String> items = store.categoryNames;
  String? itemType;
  String? brandName;
  String capacityUnit = "";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Item".text.make(),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            children: [
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Select Your Item',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: store.categories
                    .map((item) => item.isActive
                        ? DropdownMenuItem<String>(
                            value: item.name,
                            child: item.name.text.capitalize
                                .maxFontSize(14)
                                .minFontSize(14)
                                .make())
                        : DropdownMenuItem<String>(
                            value: item.name,
                            enabled: false,
                            child: item.name.text.capitalize.gray300
                                .maxFontSize(14)
                                .minFontSize(14)
                                .make()))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Item';
                  }
                },
                onChanged: (value) {
                  itemType = value as String;
                  store.addItemResult["category_name"] = value;
                  int catIndex =
                      store.categories.indexWhere((f) => f.name == value);
                  store.addItemResult["category_id"] =
                      store.categories[catIndex].id;

                  if (value == "washing machine") {
                    capacityUnit = "in Kg";
                    store.addItemResult["capacity_unit"] = "kg";
                  } else if (value == "Fridge") {
                    capacityUnit = "in Litres";
                    store.addItemResult["capacity_unit"] = "L";
                  } else {
                    capacityUnit = "";
                    store.addItemResult["capacity_unit"] = "";
                  }
                },
                onSaved: (value) {
                  itemType = value as String;
                  store.addItemResult["category_name"] = value;
                  if (value == "washing machine") {
                    capacityUnit = "in Kg";
                    store.addItemResult["capacity_unit"] = "kg";
                  } else if (value == "Fridge") {
                    capacityUnit = "in Litres";
                    store.addItemResult["capacity_unit"] = "L";
                  } else {
                    capacityUnit = "";
                    store.addItemResult["capacity_unit"] = "";
                  }
                },
              ),
              10.heightBox,
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                isExpanded: true,
                hint: const Text(
                  'Select Your Brand',
                  style: TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: store.brandName
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Brand';
                  }
                },
                onChanged: (value) {
                  brandName = value as String;
                  store.addItemResult["manufacturer"] = brandName;
                },
                onSaved: (value) {
                  brandName = value.toString();
                },
              ),
              10.heightBox,
              TextFormField(
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onChanged: (value) =>
                    store.addItemResult["description"] = value,
                validator: (String? value) =>
                    (value!.isEmpty) ? 'Required field' : null,
              ),
              8.heightBox,
              "Model Year".text.xl.bold.make(),
              CupertinoSpinBox(
                min: 1900,
                max: 2022,
                step: 1,
                value: 2020,
                onChanged: (value) => store.addItemResult["model_year"] = value,
                onSubmitted: (value) =>
                    store.addItemResult["model_year"] = value,
                textStyle: const TextStyle(fontSize: 32),
                incrementIcon: const Icon(Icons.keyboard_arrow_up, size: 58),
                decrementIcon: const Icon(Icons.keyboard_arrow_down, size: 58),
              ),
              TextFormField(
                maxLines: 1,
                maxLength: 5,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Capacity $capacityUnit",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onChanged: (value) =>
                    store.addItemResult["capacity"] = int.parse(value),
                validator: (String? value) =>
                    (value!.isEmpty) ? 'Required field' : null,
              ),
              8.heightBox,
              "Price".text.xl.bold.make(),
              CupertinoSpinBox(
                min: 1000,
                max: 200000,
                step: 100,
                value: 1000,
                onChanged: (value) => store.addItemResult["price"] = value,
                textStyle: const TextStyle(fontSize: 32),
                incrementIcon: const Icon(Icons.keyboard_arrow_up, size: 58),
                decrementIcon: const Icon(Icons.keyboard_arrow_down, size: 58),
              ),
              10.heightBox,
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      final isValid = formkey.currentState!.validate();

                      if (isValid) {
                        formkey.currentState?.save();

                        if (!store.addItemResult.containsKey("model_year")) {
                          store.addItemResult["model_year"] = 2020;
                        }
                        if (!store.addItemResult.containsKey("price")) {
                          store.addItemResult["price"] = 1000;
                        }

                        context.router.navigateNamed("/add-product-2");
                        print(store.addItemResult);
                      }
                    },
                    child: "Next".text.xl.bold.make(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
