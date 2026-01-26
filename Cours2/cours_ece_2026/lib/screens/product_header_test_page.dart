import 'package:flutter/material.dart';
import 'package:formation_flutter/widgets/product_header.dart';
import 'package:formation_flutter/widgets/product_score_banner.dart';
import 'package:formation_flutter/widgets/product_green_score_widget.dart';
import 'package:formation_flutter/widgets/data_row.dart' as data_widgets;

/// Page de test pour le widget ProductHeader
class ProductHeaderTestPage extends StatelessWidget {
  const ProductHeaderTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test ProductHeader'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Test 1 : Produit avec image locale
            const ProductHeader(
              imageUrl: 'asset:photo-1482049016688-2d3e1b311543.avif',
              productName: 'Salade Verte Bio',
              brandName: 'Ferme Locale',
            ),
            
            // Bandeau des scores
            const ProductScoreBanner(
              nutriscoreGrade: 'a',
              novaGroup: 1,
              greenScore: 'a+',
            ),
            
            // Données du produit
            const data_widgets.ProductDataRow(label: 'Quantité', value: '500g', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Vendu par', value: 'Carrefour', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Prix', value: '3.99€', showDivider: false),
            
            const SizedBox(height: 32),
            
            // Test 2 : Produit avec image réelle (Nutella)
            const ProductHeader(
              imageUrl: 'https://images.openfoodfacts.org/images/products/3017620422003/front_fr.47.400.jpg',
              productName: 'Nutella Original',
              brandName: 'Ferrero',
            ),
            
            // Bandeau des scores
            const ProductScoreBanner(
              nutriscoreGrade: 'e',
              novaGroup: 4,
              greenScore: 'c',
            ),
            
            // Données du produit
            const data_widgets.ProductDataRow(label: 'Quantité', value: '400g', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Vendu par', value: 'Auchan', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Prix', value: '2.50€', showDivider: false),
            
            const SizedBox(height: 32),
            
            // Test 3 : Produit avec texte long
            const ProductHeader(
              imageUrl: 'https://images.openfoodfacts.org/images/products/5449000050127/front_fr.38.400.jpg',
              productName: 'Coca-Cola Original Taste 330ml Can',
              brandName: 'The Coca-Cola Company',
            ),
            
            // Bandeau des scores
            const ProductScoreBanner(
              nutriscoreGrade: 'd',
              novaGroup: 4,
              greenScore: 'd',
            ),
            
            // Données du produit
            const data_widgets.ProductDataRow(label: 'Quantité', value: '330ml', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Vendu par', value: 'Leclerc', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Prix', value: '1.50€', showDivider: false),
          ],
        ),
      ),
    );
  }
}
