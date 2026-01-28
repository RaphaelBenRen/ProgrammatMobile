import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductProvider extends InheritedWidget {
  final Product product;

  const ProductProvider({
    super.key,
    required this.product,
    required super.child,
  });

  static Product of(BuildContext context) {
    final ProductProvider? result =
        context.dependOnInheritedWidgetOfExactType<ProductProvider>();
    assert(result != null, 'No ProductProvider found in context');
    return result!.product;
  }

  @override
  bool updateShouldNotify(ProductProvider oldWidget) {
    return product != oldWidget.product;
  }
}