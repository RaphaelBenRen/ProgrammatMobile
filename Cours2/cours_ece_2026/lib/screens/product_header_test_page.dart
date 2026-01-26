import 'package:flutter/material.dart';
import 'package:formation_flutter/model/button_state.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/widgets/product_header.dart';
import 'package:formation_flutter/widgets/product_score_banner.dart';
import 'package:formation_flutter/widgets/product_green_score_widget.dart';
import 'package:formation_flutter/widgets/data_row.dart' as data_widgets;
import 'package:formation_flutter/widgets/state_button.dart';

/// Page de test pour les widgets créés
class ProductHeaderTestPage extends StatefulWidget {
  const ProductHeaderTestPage({super.key});

  @override
  State<ProductHeaderTestPage> createState() => _ProductHeaderTestPageState();
}

class _ProductHeaderTestPageState extends State<ProductHeaderTestPage> {
  ButtonState? _selectedState1;
  ButtonState? _selectedState2;
  ButtonState? _selectedState3;
  
  late final Product _product;

  @override
  void initState() {
    super.initState();
    _product = generateProduct();
  }
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
            
            const SizedBox(height: 16),
            
            // Section "Recommanderiez-vous ce produit ?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommanderiez-vous ce produit ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  StateButton(
                    state: ButtonState.positive,
                    label: 'Oui',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  StateButton(
                    state: ButtonState.negative,
                    label: 'Non',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Test 2 : Produit avec image réelle (Nutella) - Using Product object
            ProductHeader(
              imageUrl: _product.picture ?? '',
              productName: _product.name ?? 'Unknown Product',
              brandName: _product.brands?.join(', ') ?? 'Unknown Brand',
            ),
            
            // Bandeau des scores - Using Product.nutriScore
            ProductScoreBanner(
              nutriscoreGrade: _getNutriscoreGrade(_product.nutriScore),
              novaGroup: _getNovaGroupNumber(_product.novaScore),
              greenScore: _getGreenScoreGrade(_product.greenScore),
            ),
            
            // Données du produit
            data_widgets.ProductDataRow(label: 'Quantité', value: _product.quantity ?? 'N/A', showDivider: true),
            data_widgets.ProductDataRow(label: 'Vendu par', value: _product.brands?.first ?? 'N/A', showDivider: true),
            data_widgets.ProductDataRow(label: 'Prix', value: 'N/A', showDivider: false),
            
            const SizedBox(height: 16),
            
            // Section "Recommanderiez-vous ce produit ?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommanderiez-vous ce produit ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  StateButton(
                    state: ButtonState.positive,
                    label: 'Oui',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  StateButton(
                    state: ButtonState.negative,
                    label: 'Non',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
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
            
            const SizedBox(height: 16),
            
            // Section "Recommanderiez-vous ce produit ?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recommanderiez-vous ce produit ?',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  StateButton(
                    state: ButtonState.positive,
                    label: 'Oui',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  StateButton(
                    state: ButtonState.negative,
                    label: 'Non',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
