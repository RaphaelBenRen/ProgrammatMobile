import 'package:flutter/material.dart';
import 'package:formation_flutter/model/button_state.dart';
import 'package:formation_flutter/widgets/product_header.dart';
import 'package:formation_flutter/widgets/product_score_banner.dart';
import 'package:formation_flutter/widgets/data_row.dart' as data_widgets;
import 'package:formation_flutter/widgets/state_button.dart';

/// Page de test pour les widgets créés
class ProductHeaderTestPage extends StatefulWidget {
  const ProductHeaderTestPage({super.key});

  @override
  State<ProductHeaderTestPage> createState() => _ProductHeaderTestPageState();
}

class _ProductHeaderTestPageState extends State<ProductHeaderTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test ProductHeader'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Produit 1 : Salade Verte Bio (données en dur)
            const ProductHeader(
              imageUrl: 'asset:photo-1482049016688-2d3e1b311543.avif',
              productName: 'Salade Verte Bio',
              brandName: 'Ferme Locale',
            ),
            const ProductScoreBanner(
              nutriscoreGrade: 'a',
              novaGroup: 1,
              greenScore: 'a+',
            ),
            const data_widgets.ProductDataRow(label: 'Quantité', value: '500g', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Vendu par', value: 'Carrefour', showDivider: true),
            const data_widgets.ProductDataRow(label: 'Prix', value: '3.99€', showDivider: false),
            const SizedBox(height: 16),
            _buildRecommendationSection(context, 'ce produit'),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context, String productName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recommanderiez-vous $productName ?',
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
      ],
    );
  }
}
