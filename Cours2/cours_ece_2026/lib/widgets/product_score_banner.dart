import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/model/product_view_model.dart';
import 'package:formation_flutter/widgets/custom_divider.dart';
import 'package:formation_flutter/widgets/product_nova_score_widget.dart';
import 'package:formation_flutter/widgets/product_nutriscore_widget.dart';
import 'package:provider/provider.dart';

class ProductScoreBanner extends StatelessWidget {
  const ProductScoreBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Product? product = context.watch<ProductViewModel>().product;
    
    if (product == null) return const SizedBox();

    final String? nutriscoreGrade = product.nutriScore?.name;
    final int? novaGroup = product.novaScore?.index;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 44,
            child: ProductNutriscoreWidget(score: nutriscoreGrade ?? 'unknown'),
          ),
          const CustomDivider(
            axis: Axis.vertical,
            thickness: 1.0,
          ),
          Expanded(
            flex: 56,
            child: ProductNovaScoreWidget(group: (novaGroup ?? -1) + 1),
          ),
        ],
      ),
    );
  }
}
