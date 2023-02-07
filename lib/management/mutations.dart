import 'package:costdeko/management/store.dart';
import 'package:costdeko/models/offers-model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/category-model.dart';

class GetCategories extends VxMutation<AppStore> {
  @override
  perform() async {
    Map<String, dynamic> data = {};
    await store?.db.collection("categories").get().then((event) {
      store?.categories = [];
      for (var doc in event.docs) {
        data = doc.data();
        data["id"] = doc.id;
        store?.categories.add(CategoryModel.fromMap(data));
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
