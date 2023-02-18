import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:costdeko/models/brand-model.dart';
import 'package:costdeko/models/category-model.dart';
import 'package:costdeko/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/feature-model.dart';
import '../models/offers-model.dart';

class AppStore extends VxStore {
  final db = FirebaseFirestore.instance;
  List<CategoryModel> categories = [];
  List<FeatureModel> features = [];
  List<String> categoryNames = [];
  List<OffersModel> offers = [];
  List<BrandModel> brands = [];
  List<BrandModel> availableBrandsModel = [];
  List<String> availableBrands = [];
  List<String> brandName = [];
  Map<String, dynamic> addItemResult = {};
  String currentUser = "USER";
  List<ProductModel> myProducts = [];
  List<ProductModel> products = [];
  Map<String, List<ProductModel>> productsWithCategories = {};
}
