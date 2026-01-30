import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/api_product_response.dart';
import 'package:formation_flutter/model/product_converter.dart';

import 'product.dart';

class ProductState with ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  ProductState() {
    loadProduct();
  }

  Future<void> loadProduct() async {
    try {
      // Créer une instance de Dio
      final dio = Dio();
      
      // Faire la requête GET vers l'API
      final response = await dio.get(
        'https://api.formation-flutter.fr/v2/getProduct',
        queryParameters: {'barcode': '5000159484695'},
      );
      
      // Dio retourne déjà un objet JSON parsé dans response.data
      // Pas besoin de jsonDecode() !
      final apiResponse = ApiProductResponse.fromJSON(response.data);
      
      // Vérifier qu'il n'y a pas d'erreur et que la réponse contient un produit
      if (apiResponse.error == null && apiResponse.response != null) {
        // Convertir l'ApiProduct en Product du domaine
        _product = convertApiProductToProduct(apiResponse.response!);
        
        // Notifier les listeners que les données ont changé
        notifyListeners();
      }
    } catch (e) {
      // En cas d'erreur, on peut logger ou gérer l'erreur
      debugPrint('Erreur lors du chargement du produit: $e');
    }
  }
}

