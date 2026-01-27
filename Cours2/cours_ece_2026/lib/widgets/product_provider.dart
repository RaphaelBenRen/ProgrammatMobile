import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

/// InheritedWidget qui permet de propager un objet Product
/// à travers l'arbre de widgets sans avoir à le passer manuellement.
class ProductProvider extends InheritedWidget {
  final Product product;

  const ProductProvider({
    super.key,
    required this.product,
    required super.child,
  });

  /// Méthode statique pour récupérer le Product depuis le contexte
  static Product of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ProductProvider>();
    if (provider == null) {
      throw FlutterError('ProductProvider not found in widget tree');
    }
    return provider.product;
  }

  /// Méthode optionnelle qui retourne null si le provider n'est pas trouvé
  static Product? maybeOf(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<ProductProvider>();
    return provider?.product;
  }

  @override
  bool updateShouldNotify(ProductProvider oldWidget) {
    // Notifie les widgets enfants si le produit a changé
    return product != oldWidget.product;
  }
}
