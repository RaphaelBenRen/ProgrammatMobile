import 'package:flutter/material.dart';
import 'package:formation_flutter/res/app_colors.dart';

/// Widget affichant le Green-Score (A+, A, B, C, D, E, F)
class ProductGreenScoreWidget extends StatelessWidget {
  const ProductGreenScoreWidget({
    super.key,
    required this.score,
  });

  final String score; // 'a+', 'a', 'b', 'c', 'd', 'e', 'f'

  String _getGreenScoreDescription() {
    switch (score.toLowerCase()) {
      case 'a+':
        return 'Très faible impact environnemental';
      case 'a':
        return 'Très faible impact environnemental';
      case 'b':
        return 'Faible impact environnemental';
      case 'c':
        return 'Impact modéré sur l\'environnement';
      case 'd':
        return 'Impact environnemental élevé';
      case 'e':
        return 'Impact environnemental très élevé';
      case 'f':
        return 'Impact environnemental très élevé';
      default:
        return 'Score inconnu';
    }
  }

  Color _getScoreColor() {
    final s = score.toLowerCase();
    if (s == 'a+' || s == 'a') return Colors.green;
    if (s == 'b') return Colors.lightGreen;
    if (s == 'c') return Colors.orange;
    if (s == 'd' || s == 'e' || s == 'f') return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre avec icône et score
            Row(
              children: [
                // Icône de feuille
                Icon(
                  Icons.eco,
                  size: 20,
                  color: _getScoreColor(),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Green-Score',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Description
            Text(
              _getGreenScoreDescription(),
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
