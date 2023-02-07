import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costdeko/models/category-model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/offers-model.dart';

class AppStore extends VxStore {
  final db = FirebaseFirestore.instance;
  List<CategoryModel> categories = [];
  List<OffersModel> offers = [];
}
