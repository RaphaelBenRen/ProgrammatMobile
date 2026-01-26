import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';

/// Widget affichant le Nutri-Score (A, B, C, D, E)
class ProductNutriscoreWidget extends StatelessWidget {
  const ProductNutriscoreWidget({
    super.key,
    required this.score,
  });

  final String score; // 'a', 'b', 'c', 'd', 'e'

  @override
  Widget build(BuildContext context) {
    final scoreUpper = score.toUpperCase();
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image du Nutri-Score
        Image.asset(
          'res/drawables/nutriscore_${score.toLowerCase()}.png',
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 60,
              height: 60,
              color: AppColors.divider,
              child: const Icon(Icons.image_not_supported),
            );
          },
        ),
        const SizedBox(height: 8),
        // Texte du score
        Text(
          'Nutri-Score $scoreUpper',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
