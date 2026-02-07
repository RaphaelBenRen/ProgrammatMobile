import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductViewModel extends ChangeNotifier {
  Product? _product; // Private attribute

  Product? get product => _product; // Getter exposing the product

  ProductViewModel() {
    loadProduct(); // Call loadProduct on initialization
  }

  void loadProduct() async {
    // Simulate delay
    await Future.delayed(const Duration(seconds: 3));

    // Initialize with fake data
    _product = generateProduct();

    // Notify listeners
    notifyListeners();
  }
}
