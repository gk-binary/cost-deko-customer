import 'package:costdeko/data/features.dart';
import 'package:costdeko/data/manufacturers.dart';
import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/offers-model.dart';
import 'package:costdeko/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/category-model.dart';

class GetCategories extends VxMutation<AppStore> {
  @override
  perform() async {
    Map<String, dynamic> data = {};
    await store?.db.collection("categories").get().then((event) {
      store?.categories = [];
      store?.categoryNames = [];
      for (var doc in event.docs) {
        data = doc.data();
        data["id"] = doc.id;
        store?.categories.add(CategoryModel.fromMap(data));
        (data["name"] != "combo")
            ? store?.categoryNames.add(data["name"])
            : null;
      }
    });
  }
}

class GetMyProducts extends VxMutation<AppStore> {
  @override
  perform() async {
    Map<String, dynamic> data = {};
    await store?.db
        .collection("products")
        .where("created_by", isEqualTo: store?.currentUser)
        .orderBy("created_on", descending: false)
        .get()
        .then((event) {
      store?.myProducts = [];
      for (var doc in event.docs) {
        data = doc.data();
        data["id"] = doc.id;
        store?.myProducts.add(ProductModel.fromMap(data));
      }
    });
  }
}

class GetOffers extends VxMutation<AppStore> {
  @override
  perform() async {
    Map<String, dynamic> data = {};
    await store?.db.collection("offers").get().then((event) {
      store?.offers = [];
      for (var doc in event.docs) {
        data = doc.data();
        data["id"] = doc.id;
        store?.offers.add(OffersModel.fromMap(data));
      }
    });
  }
}

class GetBrands extends VxMutation<AppStore> {
  @override
  perform() async {
    store?.brands = [];
    store?.brandName = [];
    store?.brands = brands;
    for (int i = 0; i < brands.length; i++) {
      store?.brandName.add(brands[i].name);
    }
    // Map<String, dynamic> data = {};
    // await store?.db.collection("offers").get().then((event) {
    //   store?.offers = [];
    //   for (var doc in event.docs) {
    //     data = doc.data();
    //     data["id"] = doc.id;
    //     store?.offers.add(OffersModel.fromMap(data));
    //   }
    // });
  }
}

class GetFeatures extends VxMutation<AppStore> {
  @override
  perform() {
    store!.features = features;
  }
}

class AddProduct extends VxMutation<AppStore> {
  final Map<String, dynamic> product;

  AddProduct({required this.product});
  @override
  perform() {
    ProductModel productModel = ProductModel.fromMapToFirebase(product);
    store?.db
        .collection("products")
        .doc(productModel.id)
        .set(productModel.toMap());
  }
}
