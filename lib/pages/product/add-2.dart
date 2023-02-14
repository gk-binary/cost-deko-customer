import 'package:costdeko/management/mutations.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/feature-model.dart';
import 'package:costdeko/widgets/checkbox-animated.dart';
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
  bool positive = false;
  bool isWarrantyDetailsActive = true;
  bool isFreeServiceActive = true;
  final formkey = GlobalKey<FormState>();

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
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            children: [
              MultiSelectDropDown(
                onOptionSelected: (List<ValueItem> selectedOptions) {
                  store.addItemResult["features"] =
                      selectedOptions.map((item) => item.label).toList();
                },
                options: feature.feature.mapIndexed((item, index) {
                  return ValueItem(label: item, value: index.toString());
                }).toList(),
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
              10.heightBox,
              Row(
                children: [
                  "Energy Rating: ".text.bold.make(),
                  5.widthBox,
                  VxRating(
                      onRatingUpdate: (value) =>
                          store.addItemResult["energy_star_rating"] =
                              double.parse(value).ceil(),
                      count: 5,
                      value: 0,
                      maxRating: 5,
                      selectionColor: Colors.teal,
                      size: 30,
                      stepInt: true),
                ],
              ),
              10.heightBox,
              TextFormField(
                maxLines: 1,
                maxLength: 5,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Power Rating in KW",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onChanged: (value) =>
                    store.addItemResult["power_rating"] = int.parse(value),
                validator: (String? value) =>
                    (value!.isEmpty) ? 'Required field' : null,
              ),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Have Warranty",
                unCheckText: "Don't have Warranty",
                onTap: (status) {
                  store.addItemResult["is_warranty_available"] = status;
                  setState(() {
                    isWarrantyDetailsActive = status;
                  });
                },
              ),
              isWarrantyDetailsActive ? 15.heightBox : Container(),
              isWarrantyDetailsActive
                  ? TextFormField(
                      maxLines: 1,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Warranty in Months",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) =>
                          store.addItemResult["warranty_period_in_months"] =
                              int.parse(value),
                    )
                  : Container(),
              10.heightBox,
              isWarrantyDetailsActive
                  ? TextFormField(
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: 'Warranty Details',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) =>
                          store.addItemResult["warranty_details"] = value,
                    )
                  : Container(),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Free service available",
                unCheckText: "No Free service available",
                onTap: (status) {
                  store.addItemResult["is_free_service_available"] = status;
                  setState(() {
                    isFreeServiceActive = status;
                  });
                },
              ),
              isFreeServiceActive ? 15.heightBox : Container(),
              isFreeServiceActive
                  ? TextFormField(
                      maxLines: 1,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Free Service Period in Months",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) =>
                          store.addItemResult["free_service_period_in_months"] =
                              int.parse(value),
                    )
                  : Container(),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Have Bill",
                unCheckText: "Don't have Bill",
                onTap: (status) {
                  store.addItemResult["is_bill_available"] = status;
                },
              ),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Emi Available",
                unCheckText: "Emi not available",
                onTap: (status) {
                  store.addItemResult["is_emi_available"] = status;
                },
              ),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Accessories available",
                unCheckText: "No Accessories available",
                onTap: (status) {
                  store.addItemResult["is_accessories_available"] = status;
                },
              ),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Free Home delivery available",
                unCheckText: "Free home delivery not available",
                onTap: (status) {
                  store.addItemResult["is_home_delivery_free"] = status;
                },
              ),
              10.heightBox,
              AnimatedSwitch(
                checkText: "Free Installation",
                unCheckText: "Installation not available",
                onTap: (status) {
                  store.addItemResult["is_free_installation_available"] =
                      status;
                },
              ),
              10.heightBox,
              Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      final isValid = formkey.currentState!.validate();

                      if (isValid) {
                        formkey.currentState?.save();
                        if (!store.addItemResult.containsKey("features")) {
                          store.addItemResult["features"] = [];
                        }
                        if (!store.addItemResult
                            .containsKey("energy_star_rating")) {
                          store.addItemResult["energy_star_rating"] = 0;
                        }
                        if (!store.addItemResult
                            .containsKey("is_warranty_available")) {
                          store.addItemResult["is_warranty_available"] =
                              isWarrantyDetailsActive;
                        }
                        if (!store.addItemResult
                            .containsKey("warranty_period_in_months")) {
                          store.addItemResult["warranty_period_in_months"] = 0;
                        }
                        if (!store.addItemResult
                            .containsKey("warranty_details")) {
                          store.addItemResult["warranty_details"] = "";
                        }
                        if (!store.addItemResult
                            .containsKey("is_free_service_available")) {
                          store.addItemResult["is_free_service_available"] =
                              isFreeServiceActive;
                        }
                        if (!store.addItemResult
                            .containsKey("free_service_period_in_months")) {
                          store.addItemResult["free_service_period_in_months"] =
                              0;
                        }
                        if (!store.addItemResult
                            .containsKey("is_bill_available")) {
                          store.addItemResult["is_bill_available"] = true;
                        }
                        if (!store.addItemResult
                            .containsKey("is_emi_available")) {
                          store.addItemResult["is_emi_available"] = true;
                        }
                        if (!store.addItemResult
                            .containsKey("is_accessories_available")) {
                          store.addItemResult["is_accessories_available"] =
                              true;
                        }
                        if (!store.addItemResult
                            .containsKey("is_home_delivery_free")) {
                          store.addItemResult["is_home_delivery_free"] = true;
                        }
                        if (!store.addItemResult
                            .containsKey("is_free_installation_available")) {
                          store.addItemResult[
                              "is_free_installation_available"] = true;
                        }

                        store.addItemResult["id"] =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        store.addItemResult["created_on"] = DateTime.now();
                        store.addItemResult["updated_on"] = DateTime.now();
                        store.addItemResult["is_reseller"] = false;
                        store.addItemResult["created_by"] = store.currentUser;

                        print(store.addItemResult);
                        AddProduct(product: store.addItemResult);
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
