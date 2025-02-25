import 'package:ecommerce_app_api/core/base/view/base_view.dart';
import 'package:ecommerce_app_api/features/splash/splash_view.dart';
import 'package:ecommerce_app_api/features/success/view/success_view.dart';
import 'package:flutter/cupertino.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    SplashView.id: (context) => const SplashView(),
    BaseView.id: (context) => const BaseView(),
    SuccessView.id: (context) => const SuccessView(),
    // ProductDetailView.id: (context) => const ProductDetailView(),
  };
}
