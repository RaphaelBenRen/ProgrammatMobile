import 'package:flutter/material.dart';
import 'package:formation_flutter/model/button_state.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/widgets/product_header.dart';
import 'package:formation_flutter/widgets/product_provider.dart';
import 'package:formation_flutter/widgets/product_score_banner.dart';
import 'package:formation_flutter/widgets/data_row.dart' as data_widgets;
import 'package:formation_flutter/widgets/state_button.dart';

class ProductHeaderTestPage extends StatefulWidget {
  const ProductHeaderTestPage({super.key});

  @override
  State<ProductHeaderTestPage> createState() => _ProductHeaderTestPageState();
}

class _ProductHeaderTestPageState extends State<ProductHeaderTestPage> {
  @override
  Widget build(BuildContext context) {
    final Product product = ProductProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test ProductHeader'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductHeader(),
            const ProductScoreBanner(),
            data_widgets.ProductDataRow(
                label: 'Quantité', value: product.quantity, showDivider: true),
            data_widgets.ProductDataRow(
                label: 'Vendu par',
                value: product.manufacturingCountries?.join(', '),
                showDivider: true),
            data_widgets.ProductDataRow(
                label: 'Code-barres', value: product.barcode, showDivider: false),
            const SizedBox(height: 16),
            _buildRecommendationSection(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context) {
    final Product product = ProductProvider.of(context);
    final String productName = product.name ?? 'ce produit';

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
