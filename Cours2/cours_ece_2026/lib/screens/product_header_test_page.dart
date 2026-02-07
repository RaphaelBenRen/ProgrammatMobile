import 'package:flutter/material.dart';
import 'package:formation_flutter/model/button_state.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/widgets/product_header.dart';
import 'package:formation_flutter/widgets/product_score_banner.dart';
import 'package:formation_flutter/widgets/data_row.dart' as data_widgets;
import 'package:formation_flutter/widgets/state_button.dart';
import 'package:provider/provider.dart';

class ProductHeaderTestPage extends StatefulWidget {
  const ProductHeaderTestPage({super.key});

  @override
  State<ProductHeaderTestPage> createState() => _ProductHeaderTestPageState();
}

class _ProductHeaderTestPageState extends State<ProductHeaderTestPage> {
  @override
  Widget build(BuildContext context) {
    // Watch for nullable Product to handle loading state
    final Product? product = context.watch<Product?>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test ProductHeader'),
      ),
      // If product is null, show loader. Otherwise, show content.
      body: product == null ? const _ProductLoader() : const _ProductDetails(),
    );
  }
}

class _ProductLoader extends StatelessWidget {
  const _ProductLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails();

  @override
  Widget build(BuildContext context) {
    // We can safely watch for Product (non-nullable) here because this widget 
    // is only rendered when Product is not null in the parent.
    // However, since the Provider is of type Product?, we must watch Product? 
    // and cast or handle it. For safety and simplicity given the Provider type:
    final Product? product = context.watch<Product?>();

    if (product == null) return const SizedBox();

    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductHeader(),
          const ProductScoreBanner(),
          data_widgets.ProductDataRow(
              label: 'Quantité',
              value: product.quantity,
              showDivider: true),
          data_widgets.ProductDataRow(
              label: 'Vendu par',
              value: product.manufacturingCountries?.join(', '),
              showDivider: true),
          data_widgets.ProductDataRow(
              label: 'Code-barres',
              value: product.barcode,
              showDivider: false),
          const SizedBox(height: 16),
          _buildRecommendationSection(context, product),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context, Product product) {
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
