import 'package:flutter/foundation.dart';

import 'product.dart';

class ProductState with ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  ProductState() {
    loadProduct();
  }

  void loadProduct() async {
    await Future.delayed(const Duration(seconds: 5));
    _product = generateProduct();
    notifyListeners();
  }
}
