import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/widgets/custom_divider.dart';
import 'package:formation_flutter/widgets/product_green_score_widget.dart';
import 'package:formation_flutter/widgets/product_nova_score_widget.dart';
import 'package:formation_flutter/widgets/product_nutriscore_widget.dart';

/// Bandeau affichant Nutri-Score (44%), Séparateur, Groupe Nova et Green-Score
class ProductScoreBanner extends StatelessWidget {
  const ProductScoreBanner({
    super.key,
    required this.nutriscoreGrade,
    required this.novaGroup,
    required this.greenScore,
  });

  final String nutriscoreGrade;
  final int novaGroup;
  final String greenScore;

  @override
  Widget build(BuildContext context) {
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
          // Nutri-Score (44%)
          Expanded(
            flex: 44,
            child: ProductNutriscoreWidget(score: nutriscoreGrade),
          ),
          // Séparateur vertical (1px)
          const CustomDivider(
            axis: Axis.vertical,
            thickness: 1.0,
          ),
          // Nova Group (56%)
          Expanded(
            flex: 56,
            child: ProductNovaScoreWidget(group: novaGroup),
          ),
        ],
      ),
    );
  }
}
