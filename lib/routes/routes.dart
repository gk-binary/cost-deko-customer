import 'package:auto_route/auto_route.dart';
import 'package:costdeko/pages/product/add-2.dart';
import 'package:costdeko/pages/product/add-3.dart';
import 'package:costdeko/pages/product/add.dart';

import '../mainscreen.dart';
import '../pages/product/list-product.dart';
import '../pages/product/view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, initial: true, path: "/"),
    AutoRoute(page: AddProduct, path: "/add-product"),
    // AutoRoute(page: AddProduct2, path: "/add-product-2"),
    CustomRoute(
        page: AddProduct2,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        path: "/add-product-2"),
    CustomRoute(
        page: AddProduct3,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        path: "/add-product-3"),
    CustomRoute(
        page: ViewProduct,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        path: "/view-product/:id"),
    CustomRoute(
        page: ListProduct,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        durationInMilliseconds: 400,
        path: "/list-product/:name")
  ],
)
class $AppRouter {}
